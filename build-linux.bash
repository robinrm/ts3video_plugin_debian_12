#!/bin/bash
source build-linux-env.bash

# Deploy
if [ ! -d "$OCS_BUILD_DIR_PATH/server/" ]; then
        mkdir $OCS_BUILD_DIR_PATH/server/
fi

# Copy dependencies
echo 'copy dependencies'
if [ $ARCH = "i686" ]; then
	echo "no logic yet..."
elif [ $ARCH = "x86_64" ]; then
	cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libgcc_s.so.1 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libc.so.6 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libpthread.so.0 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libm.so.6 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libz.so.1 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libdl.so.2 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/librt.so.1 $OCS_BUILD_DIR_PATH/server/
	cp /usr/lib/x86_64-linux-gnu/libgthread-2.0.so.0 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libglib-2.0.so.0 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libpcre.so.3 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 $OCS_BUILD_DIR_PATH/server/

	cp /lib/x86_64-linux-gnu/libQt5Core.so.5 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libQt5Network.so.5 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libQt5WebSockets.so.5 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libicui18n.so.70 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libicuuc.so.70 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libicudata.so.70 $OCS_BUILD_DIR_PATH/server/

	# only needed on debian 12
	cp /lib/x86_64-linux-gnu/libdouble-conversion.so.3 $OCS_BUILD_DIR_PATH/server/
	cp /lib/x86_64-linux-gnu/libpcre2-16.so.0 $OCS_BUILD_DIR_PATH/server/
fi

echo 'copy templates'
cp $OCS_SOURCE_DIR_PATH/projects/videoserver/res/scripts/videoserver.sh $OCS_BUILD_DIR_PATH/server/
cp $OCS_SOURCE_DIR_PATH/projects/videoserver/res/default.ini $OCS_BUILD_DIR_PATH/server/default.ini
cp $OCS_SOURCE_DIR_PATH/projects/videoserver/res/logging.conf $OCS_BUILD_DIR_PATH/server/logging.conf

cp -rf $OCS_SOURCE_DIR_PATH/projects/serverstatus $OCS_BUILD_DIR_PATH/server/

cp $OCS_BUILD_DIR_PATH/projects/videoserver/videoserver $OCS_BUILD_DIR_PATH/server/videoserver

chmod 755 $OCS_BUILD_DIR_PATH/server/default.ini $OCS_BUILD_DIR_PATH/server/logging.conf $OCS_BUILD_DIR_PATH/server/l* $OCS_BUILD_DIR_PATH/server/video*

echo 'all done'