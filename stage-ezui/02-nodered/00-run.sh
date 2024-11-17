#!/bin/bash -e

# from https://github.com/PionixInternal/pi-gen/blob/master/stage2/11-install-nodered/01-run.sh

on_chroot << EOF
  echo -------------------------------------------------------------------------
  cat /etc/resolv.conf
  echo -------------------------------------------------------------------------
  echo nameserver 8.8.8.8 > /tmp/dhcpcd.resolv.conf
  echo 2-------------------------------------------------------------------------
  cat /etc/resolv.conf
  echo 2-------------------------------------------------------------------------

  cd "/home/${FIRST_USER_NAME}/"
  curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered -o nodered.sh
  chmod a+x nodered.sh
  sudo -u "${FIRST_USER_NAME}" "./nodered.sh --confirm-install --confirm-pi"

  # cd "/home/${FIRST_USER_NAME}/"
  # sudo -u "${FIRST_USER_NAME}" "bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered) --confirm-install --confirm-pi"

  # cd "/home/${FIRST_USER_NAME}/.node-red"
  # sudo -u "${FIRST_USER_NAME}" "npm i node-red-dashboard"

  systemctl enable nodered.service
EOF
