from __future__ import print_function
 
from arm_lib.srv import Fk,FkResponse
import rospy
import numpy as np

def xRotaion(theta):
    return np.array([[1, 0, 0, 0], [0, np.cos(theta), -np.sin(theta), 0], [0, np.sin(theta),np.cos(theta), 0], [ 0,  0,  0, 1]])

def yRotaion(theta):
    return np.array([[np.cos(theta), 0, np.sin(theta), 0], [0, 1, 0, 0], [-np.sin(theta), 0, np.cos(theta), 0], [0, 0, 0, 1]])

def zRotaion(theta):
    return np.array([[np.cos(theta), -np.sin(theta), 0, 0], [np.sin(theta), np.cos(theta), 0, 0], [0, 0, 1 , 0],[0, 0, 0, 1]])
	
def zTranslation(x=0, y=0, z=0):
    return np.array([[1, 0, 0, x], [0, 1, 0, y], [0, 0, 1, z], [0, 0, 0, 1]])

def handle_fk(req):
    print("Returning FK")
    M1 = zTranslation(0, 0, 0.1)
    M2 = zRotaion(req.joint_positions[0]).dot(zTranslation(0, 0, req.link_lengths[0]))
    M3 = xRotaion(req.joint_positions[1]).dot(zTranslation(0, 0, req.link_lengths[1]))
    M4 = xRotaion(req.joint_positions[2]).dot(zTranslation(0, 0, req.link_lengths[2]))
    M5 = xRotaion(req.joint_positions[3]).dot(zTranslation(0, 0, req.link_lengths[3]))
    M6 = zRotaion(req.joint_positions[4]).dot(zTranslation(0, 0, req.link_lengths[4]))
    M7 = yRotaion(req.joint_positions[5]).dot(zTranslation(0, 0, req.link_lengths[5]))

    M = (((((M1.dot(M2)).dot(M3)).dot(M4)).dot(M5)).dot(M6)).dot(M7)
    result = [M[0][3], M[1][3], M[2][3]]
    return FkResponse(result)

def fk_server():
    rospy.init_node('fk_server')
    s = rospy.Service('fk', Fk, handle_fk)
    print("Ready to calculate Fk.")
    rospy.spin()
 
if __name__ == "__main__":
    fk_server()