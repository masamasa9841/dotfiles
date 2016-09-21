# ENV SETTINGS
export BASH_PROFILE_LOADED=true

if [ -x ~/.pyenv ]; then
    export PYENV_ROOT=~/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi

if [ -x ~/catkin_ws ]; then
    function catkin_make(){(cd $HOME/catkin_ws && command catkin_make $@) && source $HOME/catkin_ws/devel/setup.bash;}
    export MYWLAN0IP=`ifconfig wlan0 2>/dev/null | grep -o -E "([0-9]+.){3}\.([0-9]+.){2}" | head -n1 | sed -e 's/ //g'`
    export MYETH0IP=`ifconfig eth0 2>/dev/null | grep -o -E "([0-9]+.){3}\.([0-9]+.){2}" | head -n1 | sed -e 's/ //g'`
    export ROS_IP=$(echo $MYETH0IP $MYWLAN0IP 127.0.0.1 | cut -d' ' -f1)
    export ROS_MASTER_URI=http://$ROS_IP:11311
    export GAZEBO_MODEL_PATH=~/catkin_ws/src/
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
