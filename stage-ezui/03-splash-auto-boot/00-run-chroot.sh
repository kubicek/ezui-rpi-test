raspi-config nonint do_boot_behaviour B2
plymouth-set-default-theme --rebuild-initrd spinfinity
  
echo "if [[ -z \$SSH_CONNECTION ]]; then
  startx  -- -nocursor /usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://localhost:1880/ui
fi" >> /home/${FIRST_USER_NAME}/.bashrc
