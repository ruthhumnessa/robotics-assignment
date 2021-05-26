; Auto-generated. Do not edit!


(cl:in-package my_pkg-msg)


;//! \htmlinclude pos.msg.html

(cl:defclass <pos> (roslisp-msg-protocol:ros-message)
  ((vector
    :reader vector
    :initarg :vector
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (angles
    :reader angles
    :initarg :angles
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass pos (<pos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_pkg-msg:<pos> is deprecated: use my_pkg-msg:pos instead.")))

(cl:ensure-generic-function 'vector-val :lambda-list '(m))
(cl:defmethod vector-val ((m <pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_pkg-msg:vector-val is deprecated.  Use my_pkg-msg:vector instead.")
  (vector m))

(cl:ensure-generic-function 'angles-val :lambda-list '(m))
(cl:defmethod angles-val ((m <pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_pkg-msg:angles-val is deprecated.  Use my_pkg-msg:angles instead.")
  (angles m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_pkg-msg:distance-val is deprecated.  Use my_pkg-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pos>) ostream)
  "Serializes a message object of type '<pos>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'vector))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'angles))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pos>) istream)
  "Deserializes a message object of type '<pos>"
  (cl:setf (cl:slot-value msg 'vector) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'vector)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'angles) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'angles)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pos>)))
  "Returns string type for a message object of type '<pos>"
  "my_pkg/pos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pos)))
  "Returns string type for a message object of type 'pos"
  "my_pkg/pos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pos>)))
  "Returns md5sum for a message object of type '<pos>"
  "565cbe9982662021a725abd3ca8aed38")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pos)))
  "Returns md5sum for a message object of type 'pos"
  "565cbe9982662021a725abd3ca8aed38")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pos>)))
  "Returns full string definition for message of type '<pos>"
  (cl:format cl:nil "float32[3] vector~%float32[3] angles~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pos)))
  "Returns full string definition for message of type 'pos"
  (cl:format cl:nil "float32[3] vector~%float32[3] angles~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pos>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'vector) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'angles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pos>))
  "Converts a ROS message object to a list"
  (cl:list 'pos
    (cl:cons ':vector (vector msg))
    (cl:cons ':angles (angles msg))
    (cl:cons ':distance (distance msg))
))
