#!/usr/bin/env bash

# Copy the service file
cp /home/pi/scuttle_ws/src/scuttle_ros_service/systemd/ros.service /etc/systemd/system/ros.service

# Reload the daemon configurations
systemctl daemon-reload

# Enable it so that it starts when the robot boots
systemctl enable ros.service
