apt-get install ros-kinetic-mavros iproute2 ros-kinetic-image-view openssh-client
apt-get install ros-kinetic-librealsense ros-kinetic-realsense-camera
apt-get install python-wstool python-rosinstall-generator python-catkin-tools

apt-get install ros-kinetic-control-toolbox ros-kinetic-urdf ros-kinetic-eigen-conversions ros-kinetic-angles ros-kinetic-tf* ros-kinetic-geographic-msgs libgeographic-dev libeigen3-dev geographiclib-tools python-lxml python-future

wstool init ~/catkin_ws/src
rosinstall_generator --upstream mavros | tee /tmp/mavros.rosinstall
rosinstall_generator --upstream-development mavros | tee /tmp/mavros.rosinstall
rosinstall_generator mavlink | tee -a /tmp/mavros.rosinstall
wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src --rosdistro indigo -y
catkin build
