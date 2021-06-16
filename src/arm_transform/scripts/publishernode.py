#!/usr/bin/env python
import rospy
import numpy as np
import math

from transformation.msg import userinput

def x_rotation(theta, vector):
    Rx = np.array([[1, 0, 0, 0], [0, np.cos(theta), -np.sin(theta), 0], [0, np.sin(theta),np.cos(theta), 0], [ 0,  0,  0,   1]])
    return Rx @ vector
    
   
def y_rotation(theta, vector):
    Ry = np.array([[np.cos(theta), 0, np.sin(theta), 0], [0, 1,0, 0 ], [np.sin(theta), 0, np.cos(theta), 0], [0,0,0,1]])
    return Ry @ vector
    
    
def z_rotation(theta, vector):
    Rz = np.array([[np.cos(theta), np.sin(theta), 0, 0], [np.sin(theta), np.cos(theta), 0, 0], [0, 0,1 , 0],[0, 0, 0, 1]])
    return Rz @ vector
    
def translate(translateVector, vector):
    trans = np.array([[1, 0, 0, vector[0]], [0, 1, 0, vector[1]], [0, 0, 1, vector[2]], [0, 0, 0, 1]])
    return trans @ vector
    
def result(vector, vector1,  alpha, beta, gamma):

    resultTransform = x_rotation(alpha, vector)
    resultTransform = y_rotation(beta, resultTransform)
    resultTransform = z_rotation(gamma, resultTransform) 
    resultTransform = translate(vector1, resultTransform)
    return resultTransform
    
def talker():

    pub = rospy.Publisher("chatter", userinput)
    rospy.init_node("talker", anonymous = True)
    
    while not rospy.is_shutdown():
    	print ("-----------------------------")
    	print ("Enter position x for vector a")
    	x = input()
    	print ("Enter position y for vector a")
    	y = input()
    	print ("Enter position z for vector a")
    	z = input()
    	print ("Enter angle alpha")
    	a = input()
    	print ("Enter angle theta")
    	b = input()
    	print ("Enter angle gamma")
    	c = input()
    	print ("Enter position x to translate vector a")
    	i = input()
    	print ("Enter position y to translate vector a")
    	j = input()
    	print ("Enter position z to translate vector a")
    	k = input()
    	     
    	vector = np.array([x, y, z, 1], dtype = 'float64')
    	d = np.array([i, j, k], dtype = 'float64')
    	q, w, e, f = result(vector, d,  float(a), float(b), float(c))
    	print("[{}, {}, {}, {}]".format(q, w, e, f))
    	pub.publish(q, w, e, f, float(x), float(y), float(z))
    	
    	
    	     
if __name__ == '__main__':
    try:
          talker()
    except rospy.ROSInterruptException:
          pass
    	
    
    

