#!/usr/bin/env bash

# Source ROS itself
source /opt/ros/noetic/setup.bash

# Source the ROS workspace
source /home/pi/scuttle_ws/devel/setup.bash

# Start ROS
roslaunch scuttle_bringup scuttle_bringup_daemon.launch