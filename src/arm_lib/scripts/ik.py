from __future__ import print_function
 
from arm_lib.srv import Ik,IkResponse
import rospy
import numpy as np

import tinyik as ik

arm = ik.Actuator([
    "z", [0, 0, 0.15],
    "x", [0, 0, 2.0],
    "x", [0, 0, 1.0],
    "x", [0, 0, .5],
    "z", [0, 0, 0.02],
    "x", [0, 0, 0.02]
])

def handle_ik(req):
    print(f"Received Positions: {req.positions}")
    print(f"Received Angles {req.joint_positions}")
    print(f"Received Links {req.link_lengths}")
    print("Returning IK")

    arm.angles = req.joint_positions
    arm.ee = req.positions

    print(arm.ee)
    print(arm.angles)
    
    return IkResponse(arm.angles)

def ik_server():
    rospy.init_node('ik_server')
    s = rospy.Service('ik', Ik, handle_ik)
    print("Ready to calculate Ik.")
    rospy.spin()
 
if __name__ == "__main__":
    ik_server()