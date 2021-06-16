#!/usr/bin/env python
import rospy
from transformation.msg import userinput

def callback(data):
	rospy.loginfo(rospy.get_caller_id() + "\nA vector [%f %f %f] has rotated and translated to a vector [%f %f %f %f]", data.a, data.b, data.c, data.x, data.y, data.z, data.g)


def listener():

	rospy.init_node("listener", anonymous=True)
	rospy.Subscriber("chatter", userinput, callback)
	rospy.spin()
	
if __name__ == '__main__':
	listener()
