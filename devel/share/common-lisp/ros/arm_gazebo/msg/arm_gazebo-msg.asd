
(cl:in-package :asdf)

(defsystem "arm_gazebo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ModelJoints" :depends-on ("_package_ModelJoints"))
    (:file "_package_ModelJoints" :depends-on ("_package"))
  ))