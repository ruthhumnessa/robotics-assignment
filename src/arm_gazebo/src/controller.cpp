#include <functional>
#include <gazebo/gazebo.hh>
#include <gazebo/physics/physics.hh>
#include <gazebo/common/common.hh>
#include <ignition/math/Vector3.hh>
#include <iostream>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "arm_lib/input_angles.h"
#include "arm_lib/positions.h"
#include "arm_lib/Fk.h"
#include "arm_lib/Ik.h"

#include <sstream>

namespace gazebo
{
	class ModelPush : public ModelPlugin
	{

	public:
		void positionsCallback(const arm_lib::positions &msg)
		{
			ROS_INFO("Received %f %f %f", msg.x, msg.y, msg.z);

			arm_lib::Ik srv;
			srv.request.link_lengths = {0.15, 2, 1, 0.5, 0.02, 0.02};
			srv.request.joint_positions = {0, 0, 0, 0, 0, 0};
			srv.request.positions = {msg.x, msg.y, msg.z};

			for (int i = 0; i < jointList.size() - 4; i++)
			{
				srv.request.joint_positions[i] = physics::JointState(jointList[i]).Position(0);
			}

			if (ikClient.call(srv))
			{				
				ROS_INFO("Ik: [%f, %f, %f, %f, %f, %f]", srv.response.target_positions[0], srv.response.target_positions[1], srv.response.target_positions[2], srv.response.target_positions[3], srv.response.target_positions[4], srv.response.target_positions[5]);

				for (int i = 0; i < jointList.size() - 4; i++)
				{
					jointController->SetPositionTarget(jointList[i]->GetScopedName(), srv.response.target_positions[i]);
				}
			}
			else
			{
				ROS_ERROR("Failed to call service ik");
			}
		}

		void Load(physics::ModelPtr _parent, sdf::ElementPtr /*_sdf*/)
		{
			this->model = _parent;
			this->jointController = this->model->GetJointController();
			this->jointList = model->GetJoints();
			this->pid = common::PID(600.0, 200.0, 100.0);

			for (int i = 0; i < jointList.size() - 4; i++)
			{
				jointController->SetPositionTarget(jointList[i]->GetScopedName(), 0);
				jointController->SetPositionPID(jointList[i]->GetScopedName(), this->pid);
			}

			this->pid2 = common::PID(100.0, 200.0, 100.0);

			jointController->SetPositionPID(model->GetJoint("arm6_arm7_joint")->GetScopedName(), this->pid2);
			jointController->SetPositionPID(model->GetJoint("arm6_arm8_joint")->GetScopedName(), this->pid2);

			jointController->SetPositionTarget(model->GetJoint("arm1_arm2_joint")->GetScopedName(), -0.4);
			jointController->SetPositionTarget(model->GetJoint("arm6_arm7_joint")->GetScopedName(), -0.7);
			jointController->SetPositionTarget(model->GetJoint("arm6_arm8_joint")->GetScopedName(), 0.7);

			this->updateConnection = event::Events::ConnectWorldUpdateBegin(
				std::bind(&ModelPush::OnUpdate, this));

			int argc = 0;
			char **argv = NULL;
			ros::init(argc, argv, "ros_control");

			positionsSub = n.subscribe("/positions", 1000, &ModelPush::positionsCallback, this);

			fkClient = n.serviceClient<arm_lib::Fk>("fk");
			ikClient = n.serviceClient<arm_lib::Ik>("ik");

			ros::spinOnce();
		}

		void GetFk(double a1, double a2, double a3, double a4, double a5, double a6)
		{
			arm_lib::Fk srv;
			srv.request.link_lengths = {0.05, 2, 1, 0.5, 0.02, 0.02};
			srv.request.joint_positions = {a1, a2, a3, a4, a5, a6};

			if (fkClient.call(srv))
			{
				ROS_INFO("Fk: [%f, %f, %f]", srv.response.position[0], srv.response.position[1], srv.response.position[2]);
			}
			else
			{
				ROS_ERROR("Failed to call service fk");
			}
		}

		void OnUpdate()
		{
			float toDegree = 180.0 / M_PI;

			double a1 = physics::JointState(this->model->GetJoint("chasis_arm1_joint")).Position(0);
			double a2 = physics::JointState(this->model->GetJoint("arm1_arm2_joint")).Position(0);
			double a3 = physics::JointState(this->model->GetJoint("arm2_arm3_joint")).Position(0);
			double a4 = physics::JointState(this->model->GetJoint("arm3_arm4_joint")).Position(0);
			double a5 = physics::JointState(this->model->GetJoint("arm4_arm5_joint")).Position(0);
			double a6 = physics::JointState(this->model->GetJoint("arm5_arm6_joint")).Position(0);

			GetFk(a1, a2, a3, a4, a5, a6);

			ros::spinOnce();
		}

	private:
		physics::ModelPtr model;

		physics::JointControllerPtr jointController;

		physics::Joint_V jointList;

		event::ConnectionPtr updateConnection;

		common::PID pid;

		common::PID pid2;

		ros::NodeHandle n;

		ros::Subscriber positionsSub;

		ros::ServiceClient fkClient;

		ros::ServiceClient ikClient;
	};

	GZ_REGISTER_MODEL_PLUGIN(ModelPush)
}