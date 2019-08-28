
## use shell commands to log memory usage of the process in Android :

```
adb shell cat /proc/meminfo
adb shell procrank
```

<br />

## build procrank into system iamge :

procrank :  <http://androidxref.com/9.0.0_r3/xref/system/extras/procrank/>

1. change ___LOCAL_MODULE_TAGS___ from <s>debug</s> to ___optional___ in aosp/system/extra/procrank/Android.mk

2. add module ___procrank___ into ___PRODUCT_PACKAGES___ in your product's device.mk

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;patch refernece : &nbsp;[build procrank into system image/aosp_p](https://github.com/tingkts/Android-log-memory-usage/tree/master/build%20procrank%20into%20system%20image/aosp_p)
