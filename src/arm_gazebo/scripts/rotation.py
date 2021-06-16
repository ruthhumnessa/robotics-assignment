import rospy
import numpy as np
import math

def x_rotation(theta, vector):
    Rx = np.array([[1, 0, 0, 0],
     [0, np.cos(theta), -np.sin(theta), 0],
     [0, np.sin(theta),np.cos(theta), 0],
     [ 0,  0,  0,   1]])
    return Rx @ vector

def z_rotation(theta, vector):
    Rz = np.array([[np.cos(theta), -np.sin(theta), 0, 0],
     [np.sin(theta), np.cos(theta), 0, 0], 
     [0, 0,1 , 0],
     [0, 0, 0, 1]])
    return np.dot(Rz, vector)

#forward kinematics
'''
def rotationX(rad):
    return np.array([
        [1,0,0,0], 
        [0,np.cos(rad), np.sin(rad), 0],
        [0,-np.sin(rad), np.cos(rad),0],
        [0,0,0,1]

    ])
def rotationY(rad):
    return np.array([
        [np.cos(rad),0,np.sin(rad),0], 
        [0,1, 0, 0],
        [np.sin(rad), 0, np.cos(rad),0],
        [0,0,0,1]

    ])
def rotationZ(rad):
    return np.array([
        [np.cos(rad),-np.sin(rad),0,0], 
        [np.sin(rad), np.cos(rad), 0,0],
        [0,0, 1,0],
        [0,0,0,1]

    ])

def Tz(d):
    m=np.eye(4)
    m[2,3] = d
    return m
    
#print(Tz(np.radians(60)))

M1 = Tz(0.1)
M2 = rotationZ(np.radians(60)).dot(Tz(0.05))
M3 = rotationX(np.radians(30)).dot(Tz(2.0))
M4 = rotationX(np.radians(-45)).dot(Tz(1.0))
M5 = rotationX(np.radians(-30)).dot(Tz(0.5))

M = (((M1.dot(M2)).dot(M3)).dot(M4)).dot(M5)

#print(M)

import tinyik as ik
arm =ik.Actuator([
    "z", [0.0,0.0,0.15],
    "x", [0,0,2.0],
    "x", [0,0,1.0],
    "x", [0,0,0.5]
])

arm.ee=[1.0,1.0,1.0]
#ee = end effector
print(np.degrees(arm.angles))

'''