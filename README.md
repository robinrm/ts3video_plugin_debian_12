# Build Linux Server
Tested on Debian 12.9:

install following packages:
```bash
apt install -y cmake gcc g++ qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev libpcre3 libqt5websockets5-dev libqt5core5a libqt5network5 libqt5websockets5 
```

Download github repository: https://github.com/robinrm/ts3video_plugin_debian_12
unzip repo on your machine

get write access for unziped files: 
```bash
cd ts3video_plugin_debian_12-master
chmod 755 build-* CMakeLists.txt deploy.py
```

Project deployment:
```bash
./build-linux-cmake.bash
./build-linux-make.bash
```

if everything was successfully the expected output should be like:
`[100%] Built target videoserver`

now you can run `./build-linux.bash` to collect all files.

you will find the final videoserver plugin data in folder `build/server` keep in mind that the plugin should not be used as root user!

you can start the server with `./build/server/videoserver.sh start`

it's possible that the other plugins from this repository are also working properly.
But in this fork the focus is only on the debian server installation and deployment.