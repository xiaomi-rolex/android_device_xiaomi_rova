#!/vendor/bin/sh

if [ -e /sys/firmware/devicetree/base/soc/sound/qcom,msm-spk-ext-pa ]; then
	setprop ro.audio.spk-ext-pa 1
else
	setprop ro.audio.spk-ext-pa 0
fi
