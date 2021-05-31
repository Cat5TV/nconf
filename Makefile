
# A Makefile for converting selected Papirus SVG icons
# into 40x40 pixel NConf logos in PNG format.

INKSCAPE ?= inkscape
WIDTH ?= 40
HEIGHT ?= 40

INPUT += apps/distributor-logo-archlinux.svg
INPUT += apps/distributor-logo-android.svg
INPUT += apps/distributor-logo-debian.svg
INPUT += apps/distributor-logo-fedora.svg
INPUT += apps/distributor-logo-freebsd.svg
INPUT += apps/distributor-logo-linux-mint.svg
INPUT += apps/distributor-logo-mac.svg
INPUT += apps/distributor-logo-netbsd.svg
INPUT += apps/distributor-logo-openbsd.svg
INPUT += apps/distributor-logo-opensuse.svg
INPUT += apps/distributor-logo-raspbian.svg
INPUT += apps/distributor-logo-rhel.svg
INPUT += apps/distributor-logo-ubuntu.svg
INPUT += apps/distributor-logo-windows.svg

INPUT += apps/plex.svg
INPUT += apps/kodi.svg

INPUT += devices/camera-web.svg
INPUT += devices/camera-video.svg
INPUT += devices/computer.svg
INPUT += devices/computer-laptop.svg
INPUT += devices/drive-harddisk.svg
INPUT += devices/gnome-dev-ethernet.svg
INPUT += devices/gnome-dev-printer.svg
INPUT += devices/modem.svg
INPUT += devices/network-server.svg
INPUT += devices/network-vpn.svg
INPUT += devices/network-wireless.svg
INPUT += devices/phone.svg
INPUT += devices/scanner.svg
INPUT += devices/tablet.svg
INPUT += devices/uninterruptible-power-supply.svg
INPUT += devices/video-television.svg

#OUTPUT = $(addsuffix .png, $(notdir ${INPUT})
OUTPUT = $(addprefix img/logos/papirus/,$(patsubst %.svg,%.png,$(notdir ${INPUT})))

all: papirus-icon-theme ${OUTPUT}
	git add ${OUTPUT}

papirus-icon-theme:
	git clone git@github.com:PapirusDevelopmentTeam/papirus-icon-theme.git

img/logos/papirus/%.png: papirus-icon-theme/Papirus/128x128/apps/%.svg
	echo $<
	mkdir -p img/logos/papirus
	$(INKSCAPE) -z --file=$< --export-png=$@ --export-width=${WIDTH} --export-height=${HEIGHT}

img/logos/papirus/%.png: papirus-icon-theme/Papirus/128x128/devices/%.svg
	echo $<
	mkdir -p img/logos/papirus
	$(INKSCAPE) -z --file=$< --export-png=$@ --export-width=${WIDTH} --export-height=${HEIGHT}


