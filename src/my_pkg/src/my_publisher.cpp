#include "ros/ros.h"
#include "std_msgs/String.h"

#include <sstream>
#include "my_pkg/pos.h"
#include "my_pkg/op.h"

double degreeToRad(int64_t degree){
  double pi = 3.14159265359;
  return (degree * (pi / 180));
}

float temp_x=0, temp_y=0, temp_z = 0;
void chatterCallback(const my_pkg::pos::ConstPtr& msg){

  float  x, y, z;
  temp_x = msg->vector[0];
  temp_y = msg->vector[1];
  temp_z = msg->vector[2];


  //rotate in x
  y = temp_y;
  z = temp_z;
  temp_y = (y * cos(msg->angles[0])) - (z * sin(msg->angles[0]));
  temp_z = (y * sin(msg->angles[0])) + (z * cos(msg->angles[0]));


  //rotate in y
  x = temp_x;
  z = temp_z;
  temp_x = (x * cos(msg->angles[1])) + (z * sin(msg->angles[1]));
  temp_z = (z * cos(msg->angles[1])) - (x * sin(msg->angles[1]));

  //rotate in z
  x = temp_x;
  y = temp_y;
  temp_x = (y * sin(msg->angles[2])) - (x * cos(msg->angles[2]));
  temp_y = (y * cos(msg->angles[2])) + (x * sin(msg->angles[2]));

  //translate d in x
  temp_x += msg->distance;


}

int main(int argc, char **argv)
{

  ros::init(argc, argv, "talker");


  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("input", 1000, chatterCallback);

  ros::Publisher chatter_pub = n.advertise<my_pkg::op>("chatter", 1000);

  ros::Rate loop_rate(10);


  // int count = 0;
  while (ros::ok())
  {

    my_pkg::op op;
    op.x = temp_x;
    op.y = temp_y;
    op.z = temp_z;


    // ROS_INFO();


    chatter_pub.publish(op);

    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}

