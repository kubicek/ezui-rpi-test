#!/bin/bash -e

on_chroot << EOF
  cd "/home/${FIRST_USER_NAME}/"
  su "${FIRST_USER_NAME}" -c "bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered) --confirm-install --confirm-pi"

  cd "/home/${FIRST_USER_NAME}/.node-red"
  su "${FIRST_USER_NAME}" -c "npm i node-red-dashboard"

  systemctl enable nodered.service
EOF
