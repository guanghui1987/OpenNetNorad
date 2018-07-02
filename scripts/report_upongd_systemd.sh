#!/bin/sh

# Copyright (c) 2017-present, Facebook, Inc.
# All rights reserved.

# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.

# Log server IP address
LOG_SERVER="192.168.1.125"

# Controller pull cmds
REGISTER_RUNNING="/usr/bin/wget -O - --post-data=xkey=c79c2a46728d469487b9670c42d9f87e&is_active=1 http://$LOG_SERVER:5000/v1/servers/update"
REGISTER_STOPPED="/usr/bin/wget -O - --post-data=xkey=c79c2a46728d469487b9670c42d9f87e&is_active=0 http://$LOG_SERVER:5000/v1/servers/update"

if [ -n "systemctl is-active sshd >/dev/null 2>&1" ]; then
    REG_RES=`$REGISTER_RUNNING`
else
    REG_RES=`$REGISTER_STOPPED`
fi
