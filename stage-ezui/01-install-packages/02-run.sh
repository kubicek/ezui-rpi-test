on_chroot << EOF
  raspi-config nonint do_boot_behaviour B2
  plymouth-set-default-theme --rebuild-initrd spinfinity

  SUDO_USER="${FIRST_USER_NAME}" bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
  SUDO_USER="${FIRST_USER_NAME}" ~/.node-red; npm i node-red-dashboard
  systemctl enable nodered.service
  
  echo "if [[ -z \$SSH_CONNECTION ]]; then
    startx  -- -nocursor /usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://localhost:1880/ui
fi" >> /home/${FIRST_USER_NAME}/.bashrc
EOF