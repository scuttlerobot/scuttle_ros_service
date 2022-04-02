#!/usr/bin/env bash

bash -c "source /opt/ros/noetic/setup.bash && source /home/pi/scuttle_ws/devel/setup.bash && roslaunch scuttle_bringup scuttle_bringup_daemon.launch"