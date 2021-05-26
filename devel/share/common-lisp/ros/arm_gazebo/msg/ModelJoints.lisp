; Auto-generated. Do not edit!


(cl:in-package arm_gazebo-msg)


;//! \htmlinclude ModelJoints.msg.html

(cl:defclass <ModelJoints> (roslisp-msg-protocol:ros-message)
  ((jointOneAngle
    :reader jointOneAngle
    :initarg :jointOneAngle
    :type cl:float
    :initform 0.0)
   (jointTwoAngle
    :reader jointTwoAngle
    :initarg :jointTwoAngle
    :type cl:float
    :initform 0.0)
   (jointThreeAngle
    :reader jointThreeAngle
    :initarg :jointThreeAngle
    :type cl:float
    :initform 0.0)
   (jointFourAngle
    :reader jointFourAngle
    :initarg :jointFourAngle
    :type cl:float
    :initform 0.0))
)

(cl:defclass ModelJoints (<ModelJoints>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModelJoints>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModelJoints)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arm_gazebo-msg:<ModelJoints> is deprecated: use arm_gazebo-msg:ModelJoints instead.")))

(cl:ensure-generic-function 'jointOneAngle-val :lambda-list '(m))
(cl:defmethod jointOneAngle-val ((m <ModelJoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_gazebo-msg:jointOneAngle-val is deprecated.  Use arm_gazebo-msg:jointOneAngle instead.")
  (jointOneAngle m))

(cl:ensure-generic-function 'jointTwoAngle-val :lambda-list '(m))
(cl:defmethod jointTwoAngle-val ((m <ModelJoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_gazebo-msg:jointTwoAngle-val is deprecated.  Use arm_gazebo-msg:jointTwoAngle instead.")
  (jointTwoAngle m))

(cl:ensure-generic-function 'jointThreeAngle-val :lambda-list '(m))
(cl:defmethod jointThreeAngle-val ((m <ModelJoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_gazebo-msg:jointThreeAngle-val is deprecated.  Use arm_gazebo-msg:jointThreeAngle instead.")
  (jointThreeAngle m))

(cl:ensure-generic-function 'jointFourAngle-val :lambda-list '(m))
(cl:defmethod jointFourAngle-val ((m <ModelJoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_gazebo-msg:jointFourAngle-val is deprecated.  Use arm_gazebo-msg:jointFourAngle instead.")
  (jointFourAngle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModelJoints>) ostream)
  "Serializes a message object of type '<ModelJoints>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'jointOneAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'jointTwoAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'jointThreeAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'jointFourAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModelJoints>) istream)
  "Deserializes a message object of type '<ModelJoints>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'jointOneAngle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'jointTwoAngle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'jointThreeAngle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'jointFourAngle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModelJoints>)))
  "Returns string type for a message object of type '<ModelJoints>"
  "arm_gazebo/ModelJoints")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModelJoints)))
  "Returns string type for a message object of type 'ModelJoints"
  "arm_gazebo/ModelJoints")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModelJoints>)))
  "Returns md5sum for a message object of type '<ModelJoints>"
  "7b58cc9c6acfc74729d0ca9f99d93c5a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModelJoints)))
  "Returns md5sum for a message object of type 'ModelJoints"
  "7b58cc9c6acfc74729d0ca9f99d93c5a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModelJoints>)))
  "Returns full string definition for message of type '<ModelJoints>"
  (cl:format cl:nil "float64 jointOneAngle~%float64 jointTwoAngle~%float64 jointThreeAngle~%float64 jointFourAngle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModelJoints)))
  "Returns full string definition for message of type 'ModelJoints"
  (cl:format cl:nil "float64 jointOneAngle~%float64 jointTwoAngle~%float64 jointThreeAngle~%float64 jointFourAngle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModelJoints>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModelJoints>))
  "Converts a ROS message object to a list"
  (cl:list 'ModelJoints
    (cl:cons ':jointOneAngle (jointOneAngle msg))
    (cl:cons ':jointTwoAngle (jointTwoAngle msg))
    (cl:cons ':jointThreeAngle (jointThreeAngle msg))
    (cl:cons ':jointFourAngle (jointFourAngle msg))
))
