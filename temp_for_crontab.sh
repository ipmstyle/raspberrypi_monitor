#!/bin/bash

sudo chown pi:pi rpi_gpu_temp
sudo chmod 775 rpi_gpu_temp
sudo cp rpi_gpu_temp /usr/local/bin
cat <(crontab -l) <(echo "*/5 * * * * /bin/bash rpi_gpu_temp >> /var/log/gpu_temp 2>&1") | crontab -

sudo chown pi:pi rpi_cpu_temp
sudo chmod 775 rpi_cpu_temp
sudo cp rpi_cpu_temp /usr/local/bin
cat <(crontab -l) <(echo "*/5 * * * * /bin/bash rpi_cpu_temp >> /var/log/cpu_temp 2>&1") | crontab -
