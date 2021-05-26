;; Auto-generated. Do not edit!


(when (boundp 'my_pkg::pos)
  (if (not (find-package "MY_PKG"))
    (make-package "MY_PKG"))
  (shadow 'pos (find-package "MY_PKG")))
(unless (find-package "MY_PKG::POS")
  (make-package "MY_PKG::POS"))

(in-package "ROS")
;;//! \htmlinclude pos.msg.html


(defclass my_pkg::pos
  :super ros::object
  :slots (_vector _angles _distance ))

(defmethod my_pkg::pos
  (:init
   (&key
    ((:vector __vector) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:angles __angles) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _vector __vector)
   (setq _angles __angles)
   (setq _distance (float __distance))
   self)
  (:vector
   (&optional __vector)
   (if __vector (setq _vector __vector)) _vector)
  (:angles
   (&optional __angles)
   (if __angles (setq _angles __angles)) _angles)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; float32[3] _vector
    (* 4    3)
    ;; float32[3] _angles
    (* 4    3)
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[3] _vector
     (dotimes (i 3)
       (sys::poke (elt _vector i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _angles
     (dotimes (i 3)
       (sys::poke (elt _angles i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[3] _vector
   (dotimes (i (length _vector))
     (setf (elt _vector i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _angles
   (dotimes (i (length _angles))
     (setf (elt _angles i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_pkg::pos :md5sum-) "565cbe9982662021a725abd3ca8aed38")
(setf (get my_pkg::pos :datatype-) "my_pkg/pos")
(setf (get my_pkg::pos :definition-)
      "float32[3] vector
float32[3] angles
float32 distance

")



(provide :my_pkg/pos "565cbe9982662021a725abd3ca8aed38")


