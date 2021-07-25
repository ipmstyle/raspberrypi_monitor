#!/bin/bash

USER=who | awk '{ print $1}'
echo $USER

sudo chown $USER:$USER rpi_gpu_temp
sudo chmod 775 rpi_gpu_temp
sudo cp rpi_gpu_temp /usr/local/bin
cat <(crontab -l) <(echo "*/5 * * * * /usr/local/bin/rpi_gpu_temp >> /var/log/gpu_temp 2>&1") | crontab -

sudo chown $USER:$USER rpi_cpu_temp
sudo chmod 775 rpi_cpu_temp
sudo cp rpi_cpu_temp /usr/local/bin
cat <(crontab -l) <(echo "*/5 * * * * /usr/local/bin/rpi_cpu_temp >> /var/log/cpu_temp 2>&1") | crontab -

sudo touch /var/log/cpu_temp
sudo chown $USER:$USER /var/log/cpu_temp

sudo touch /var/log/gpu_temp
sudo chown $USER:$USER /var/log/gpu_temp
