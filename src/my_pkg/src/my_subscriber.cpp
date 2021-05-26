#include "ros/ros.h"
#include "std_msgs/String.h"
#include "my_pkg/op.h"
#include <math.h>
#include <cmath>


void chatterCallback(const my_pkg::op::ConstPtr& op)
{
  
  ROS_INFO("New vector: [%.2f, %.2f, %.2f]", op->x, op->y, op->z);
}

int main(int argc, char **argv)
{

  ros::init(argc, argv, "listener");

  ros::NodeHandle n;


  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);


  ros::spin();

  return 0;
}
