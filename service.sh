#!/system/bin/sh
MODDIR=${0%/*}
exec 3>&1 4>&2 2>/data/adb/sd.log 1>&2
set -x
cd $MODDIR

MountList="
/product/priv-app/Wellbeing/Wellbeing.apk
/product/app/LatinImeGoogle/LatinImeGoogle.apk
/product/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk
/product/app/Chrome/Chrome.apk
/product/app/Maps/Maps.apk
/product/app/YouTube/YouTube.apk
/product/app/YTMusic/YTMusic.apk
/product/app/talkback/talkback.apk
/product/priv-app/AndroidAutoStub/AndroidAutoStub.apk
/product/app/Drive/Drive.apk
/product/app/Duo/Duo.apk
/product/app/Gmail2/Gmail2.apk
/product/app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk
/product/app/Videos/Videos.apk
/system/app/cust_WordlyBrowser_V1.2.6_translate_0416_1827/cust_WordlyBrowser_V1.2.6_translate_0416_1827.apk
/product/app/GoogleTTS/GoogleTTS.apk
/product/priv-app/GmsCore/GmsCore.apk
/product/priv-app/Phonesky/Phonesky.apk
/product/priv-app/Velvet/Velvet.apk
/system_ext/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
"
DummyApk=./dummy.apk
touch $DummyApk

for MountApk in $MountList
do
	mount -o bind $DummyApk $MountApk
  ls -l $MountApk
done

set +x
exec 1>&3 2>&4 3>&- 4>&-
