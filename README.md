# scuttle_ros_service

The scripts and config files necessary to create a [systemd daemon](https://en.wikipedia.org/wiki/Systemd)
that automatically starts the SCUTTLE specific ROS nodes on a physical SCUTTLE robot. This means that
your SCUTTLE will be ready to receive your commands as soon as it has connected to the local Wifi.

## Dependencies

The configurations in this repository assume you have the following prerequisites installed on the
device on which you want to run this code. That device might be an Ubuntu machine or a physical
SCUTTLE using Raspberry Pi OS.

1. [ROS Noetic](http://wiki.ros.org/noetic).
1. A working [ROS workspace](http://wiki.ros.org/catkin/Tutorials/create_a_workspace).
1. The [scuttle_bringup](https://github.com/scuttlerobot/scuttle_bringup) package installed
   in your workspace.

## Usage

First you need to clone the [scuttle_ros_service](https://github.com/scuttlerobot/scuttle_ros_service)
repository to your workspace directory on the SCUTTLE robot.

    cd <WORKSPACE_DIRECTORY_PATH>/src
    git clone -b noetic https://github.com/scuttlerobot/scuttle_ros_service.git

where `WORKSPACE_DIRECTORY_PATH` is the [ROS workspace](http://wiki.ros.org/catkin/workspaces) you have
created. Note that the script and the systemd configuration file assume that you have cloned the
`scuttle_ros_service` repository in the `/home/pi/scuttle_ws/src/scuttle_ros_service` directory. If
you have created a different directory then you will need to update the following files to point
to the correct location.

* [systemd/ros.service](https://github.com/scuttlerobot/scuttle_ros_service/blob/noetic/systemd/ros.service)
* [scripts/run_ros.sh](https://github.com/scuttlerobot/scuttle_ros_service/blob/noetic/scripts/run_ros.sh)
* [scripts/setup_ros_daemon.sh](https://github.com/scuttlerobot/scuttle_ros_service/blob/noetic/scripts/setup_ros_daemon.sh)

If the script files point to the correct location, then you can run the
[`scripts/setup_ros_daemon.sh`](https://github.com/scuttlerobot/scuttle_ros_service/blob/noetic/scripts/setup_ros_daemon.sh)
script which will configure a systemd service that will start ROS.

*Note:* The [systemd/ros.service](https://github.com/scuttlerobot/scuttle_ros_service/blob/noetic/systemd/ros.service)
assumes that there is a user with the username `pi` on the system. If you want to run your ROS nodes
as a different user then you'll need to change the username in the `ros.service` file.

Once you have installed ROS as a service you can restart the Raspberry Pi

    sudo shutdown -r -now

Once the Pi completes the restart it should connect to the network and start the ROS stack. If you have
the joystick connected then you should now be able to drive your SCUTTLE around with the Joystick.

