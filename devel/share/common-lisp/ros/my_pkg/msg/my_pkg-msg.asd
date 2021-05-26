
(cl:in-package :asdf)

(defsystem "my_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "op" :depends-on ("_package_op"))
    (:file "_package_op" :depends-on ("_package"))
    (:file "pos" :depends-on ("_package_pos"))
    (:file "_package_pos" :depends-on ("_package"))
  ))