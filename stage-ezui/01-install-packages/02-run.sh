on_chroot << EOF
  raspi-config nonint do_boot_behaviour B2
  systemctl enable nodered.service
  plymouth-set-default-theme --rebuild-initrd spinfinity

  echo "if [[ -z \$SSH_CONNECTION ]]; then
    startx  -- -nocursor /usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://localhost:1880/ui
fi" >> /home/ezui/.bashrc

  su ezui -c "bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)"
  su ezui -c "~/.node-red; npm i node-red-dashboard"
EOF