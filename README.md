# mom_tesla
My mother car) Based on gyroscooter with stm32 f103 controller

Original repository: https://github.com/EFeru/hoverboard-firmware-hack-FOC

launch watcher for auto rebuild binary:
./watch_run.sh

write hover.bin to the mcu:
st-flash --reset write build/hover.bin 0x08000000

# Next block with instal info for ubuntu-server 22.04 LTS) Servers anywhere)))) 
# If you use st-link utility - you not need GCC. But I love GCC!!!

## 1. Requirements

```
sudo apt-get install git make cmake libusb-1.0-0-dev gcc build-essential inotify-tools
```


## 2) Install gcc-arm-none-eabi

in install_files you can find tar for linux

```
tar -jxf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
```

move unzipped folder to /opt/gcc-arm-none-eabi-10.3-2021.10

add this line to the end of [~/.bashrc] file 

```
export PATH="/opt/gcc-arm-none-eabi-10.3-2021.10/bin:$PATH"
```

relaunch terminal and check version:

```
arm-none-eabi-gcc --version
```

## 3) run make

```
make
```

## 4) install st-link driver and utilites
Original page here:

```
https://freeelectron.ro/installing-st-link-v2-to-flash-stm32-targets-on-linux/
```

download and build the ST-Link utilities:

```
cd ~/
mkdir stm32
cd stm32
git clone https://github.com/stlink-org/stlink
cd stlink
cmake .
make
```


Now we copy the built binaries to their place:

```
cd bin
sudo cp st-* /usr/local/bin
cd ../lib
sudo cp *.so* /lib32
```

then udev rules:

```
sudo cp stlink/config/udev/rules.d/49-stlinkv* /etc/udev/rules.d/
```

Now, plug the ST-Link device into the USB port, but DON’T CONNECT the target board, then type:

```
lsusb
st-info --probe
st-flash read dummy.bin 0 0xFFFF
```

If all ok - try upload firmware:

```
make

st-flash --reset write build/f1033.bin 0x08000000

```



 st-flash --flash=256k erase 0x08000000 2048


# For automatic compile I use watch_run.sh (with inotifywait) - when you change some files - runned make with remove old binaries.





