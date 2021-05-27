#include <functional>
#include <gazebo/gazebo.hh>
#include <gazebo/physics/physics.hh>
#include <gazebo/common/common.hh>
#include <ignition/math/Vector3.hh>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include <string>

namespace gazebo
{
  class ModelPush : public ModelPlugin
  {
    ros::Publisher publisher;
    public: void Load(physics::ModelPtr _parent, sdf::ElementPtr /*_sdf*/)
    {
      char* argv;
      int argc;
      ros::init(argc, &argv, "angle_publisher");
      ros::NodeHandle n;
      ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
      //ros::Rate loop_rate(10);
      // Store the pointer to the model
      this->model = _parent;
      this->publisher= chatter_pub;
      // Listen to the update event. This event is broadcast every
      // simulation iteration.
      this->updateConnection = event::Events::ConnectWorldUpdateBegin(
          std::bind(&ModelPush::OnUpdate, this));
    }

    // Called by the world update start event
    public: void OnUpdate()
    {
      // Apply a small linear velocity to the model.
      //this->model->SetLinearVel(ignition::math::Vector3d(.3, 0, 0));
      const std::string joint_names[4] = {"arm1_base_joint", "arm1_arm2_joint", "arm2_arm3_joint", 	    "arm3_arm4_joint"};
       for (int i = 0; i < 4; i++){
      		physics::JointPtr joint= this->model->GetJoint(joint_names[i]);
      		std::string pos0= std::to_string(joint->Position(0));
      		std::string pos1= std::to_string(joint->Position(1));
      		std::string pos2= std::to_string(joint->Position(2));
      		std::string full_message= joint_names[i] + "=" +" (" +pos0+ "," +pos1 + "," +pos2 + ")";
      		std_msgs::String msg;
      		msg.data = full_message;
      		this->publisher.publish(msg);
      }
    }

    // Pointer to the model
    private: physics::ModelPtr model;

    // Pointer to the update event connection
    private: event::ConnectionPtr updateConnection;
  };

  // Register this plugin with the simulator
  GZ_REGISTER_MODEL_PLUGIN(ModelPush)
}
