#include <ros/ros.h>
#include <iostream>
#include "std_msgs/String.h"
#include "arm_lib/input_command.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, "input_command_publisher");

  ros::NodeHandle n;
  ros::Publisher p = n.advertise<arm_lib::input_command>("command_chatter", 1000);

  arm_lib::input_command msg;
  
   std::string command;
   
   while (ros::ok())
  {
    std::cout << "Type relese or catch command to the gripper: ";
    std::getline(std::cin, command);


    msg.command_name = command;
    ROS_INFO("%s", msg.command_name);
    p.publish(msg);

    ros::spinOnce();
  }

  return 0;
}	

	
