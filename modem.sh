#!/bin/bash

# мегафон модем через NDIS
# режим работы AT^SETPORT="FF;12,16"

case $1 in
	on)
	echo -en 'AT^NDISDUP=1,1,"internet"\r\n' > /dev/ttyUSB0
	dhclient wwx001e101f0000
	;;
	off)
	echo -en 'AT^NDISDUP=1,0\r\n' > /dev/ttyUSB0
	;;
	3g)
	echo -en 'AT^SYSCFGEX="02",3FFFFFFF,0,2,7FFFFFFFFFFFFFFF,,\r\n' > /dev/ttyUSB0
	;;
	4g)
	echo -en 'AT^SYSCFGEX="03",3FFFFFFF,0,2,7FFFFFFFFFFFFFFF,,\r\n' > /dev/ttyUSB0
	;;
	quiet)
	echo -en 'AT^CURC=0\r\n' > /dev/ttyUSB0
	;;
	reset)
	echo -en 'AT^RESET\r\n' > /dev/ttyUSB0
	;;
	*)
	echo -en 'Неизвестные аргументы\n'
	;;
esac
