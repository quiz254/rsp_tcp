# rsp_tcp

(c)2018 F4FHH Nicolas (f4fhh@ducor.fr). Licensed under the GNU GPL V3

(c)2019 ON5HB Bas Heijermans, Forked and adjusted for websdr.org

## a rtl_tcp compatible IQ server for the RSP range of SDRPlay SDR

rsp_tcp is a direct port of [rtl_tcp](https://github.com/osmocom/rtl-sdr) for the RSP range of [SDRPlay SDR](https://www.sdrplay.com/).

As the rtl_tcp protocol is only 8 bits IQ, man will loose the major advantage of an RSP : its 14bits ADC, but :

1. It will work with any rtl_tcp capable frontend (probably), see usage below
2. As it's opensource, you could compile it on any Linux server

## OPTIONS
Usage:

	-a listen address
	
	-p listen port (default: 1234)
	
	-d RSP device to use (default: 1, first found)
	
	-P Antenna Port select* (0/1/2, default: 0, Port A)
	
	-r Gain reduction (default: 60 / values 0 upto 78)
	
	-L Low Noise Amplifier* (default: enabled)
	
	-T Bias-T enable* (default: disabled)
	
	-D DAB Notch disable* (default: enabled)
	
	-B Broadcast Notch disable* (default: enabled)
	
	-R Refclk output enable* (default: disabled)
	
	-f frequency to tune to (Hz) - If freq set progfreq is ignored!!
	
	-s samplerate in [Hz] - If sample rate is set it will be ignored from client!!
	
	-W widebandfilters enable* (default: disabled)
	
	-A Auto Gain Control (default: -28 / values 0 to -60)
	
	-n max number of linked list buffers to keep (default: 16384)
	
	-b Sample bit-depth (8/16 default: 8)
	
	-v Verbose output (debug) enable (default: disabled)

## USAGE
 - This software is optimised for usage with websdr.org software. 
 - Use !rtl_sdr adress/port/ppm like you normally would with an RTL-dongle
 - RTL RF gain is set automaticly, not much change needed unless signals are too low or high
 - RTL sample rates tested are those in the websdr.org documentation but lower even down to 62500 has been tested.
 - Install the HW/API 2.13 driver from RSPplay for the RSP1A first!!

## BUILDING
```
  mkdir build
  cd build
  cmake ..
  make
  sudo make install
```
## NOTES
 - a RSP API version >=2.13 must be installed on the linux server, see [sdrplay linux downloads](https://www.sdrplay.com/downloads/)
 - It should compile and run on Raspbian (raspberry pi) (not tested)
 - It should compile on windows as the initial code from rtl_tcp does
 - The goal of this software is ONLY to work well with websdr.org, no other websdr servers or RTL-compatible software but it may work.

## TODO
 - Enhance the IF and RF gain management depending on bands, often edges of the bands are not flat like with 1536000 samplerate.
 - BiasT doesn't work no matter what I try, tested 2 RSP1A no BiasT
 
## HISTORY (later versions are forked by Bas ON5HB from original of F4FHH)
 - Version 0.1.0: Initial build
 - Version 0.1.4: Added extra options Bas.
 - Version 0.1.5: Added Decimate factor, has to be tested.
 - Version 0.1.7: Gain reducion changed from -g to -r, didn't work.
 - Version 0.2.4: Removed Decimate option - supported rates 62500/128000/256000/512000/1024000/2048000/2880000 (tested modes)
 - Version 0.2.5: Made a bandwidth mistake, fixed, was set too small
 - Version 0.2.7: Auto-decimate and a lot more buffers. 8/16bit mode, 16bit does not work with websdr.org
 - Version 0.2.8: More buffers else multiple multiple boxes will stutter.
 - Version 0.3.0: No more settings needed unless the defaults aren't good for you.
 - Version 0.3.2: Splitted Broadcast and DAB notches and they are anabled by default
 - Version 0.3.3: When -f is used at commandline the server will ignore frequency changes from client like progfreq!!!
 - Version 0.3.4: When -s is used at commandline the server will ignore samplerate settings from the client!!!
 
## CREDITS
 - [Open Source Mobile Communications (OSMOCOM)](https://github.com/osmocom/rtl-sdr.git) team for the original rtl_tcp code
 - [Thierry Leconte](https://github.com/TLeconte/airspy_tcp.git) for many ideas that I found in his Airspy port of rtl_tcp
 - [Tony Hoyle](https://github.com/TonyHoyle/sdrplay.git) for the initial idea
 - [Pothosware](https://github.com/pothosware) for the cmake build examples
 - [Nicolas F4FHH] for creating the original code to work with rtl_tcp compatible software
