// Auto-generated. Do not edit!

// (in-package my_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class pos {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vector = null;
      this.angles = null;
      this.distance = null;
    }
    else {
      if (initObj.hasOwnProperty('vector')) {
        this.vector = initObj.vector
      }
      else {
        this.vector = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('angles')) {
        this.angles = initObj.angles
      }
      else {
        this.angles = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type pos
    // Check that the constant length array field [vector] has the right length
    if (obj.vector.length !== 3) {
      throw new Error('Unable to serialize array field vector - length must be 3')
    }
    // Serialize message field [vector]
    bufferOffset = _arraySerializer.float32(obj.vector, buffer, bufferOffset, 3);
    // Check that the constant length array field [angles] has the right length
    if (obj.angles.length !== 3) {
      throw new Error('Unable to serialize array field angles - length must be 3')
    }
    // Serialize message field [angles]
    bufferOffset = _arraySerializer.float32(obj.angles, buffer, bufferOffset, 3);
    // Serialize message field [distance]
    bufferOffset = _serializer.float32(obj.distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type pos
    let len;
    let data = new pos(null);
    // Deserialize message field [vector]
    data.vector = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [angles]
    data.angles = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [distance]
    data.distance = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_pkg/pos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '565cbe9982662021a725abd3ca8aed38';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[3] vector
    float32[3] angles
    float32 distance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new pos(null);
    if (msg.vector !== undefined) {
      resolved.vector = msg.vector;
    }
    else {
      resolved.vector = new Array(3).fill(0)
    }

    if (msg.angles !== undefined) {
      resolved.angles = msg.angles;
    }
    else {
      resolved.angles = new Array(3).fill(0)
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    return resolved;
    }
};

module.exports = pos;
