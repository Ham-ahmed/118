
#!/bin/sh
# Plugin: Live FeedFinder v 1.0
# By: Bahaa (Linuxcode)
echo '======================================================'
echo '           Plugin BY- BAHAA LINUXCODE\n               '
echo '                FeedCatcher                 '
echo '======================================================'
echo "Starting installation..."
sleep 3
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/FeedCatcher
rm -rf /tmp/Live_FeedFinder.tar.gz
echo "> Installing Beautiful Soup package..."
opkg install python3-beautifulsoup4
echo "> Downloading Live FeedCatcher..."
wget -q --no-check-certificate "https://raw.githubusercontent.com/Bahaa-E2/FeedCatcher/refs/heads/main/FeedCatcher.tar.gz" -O /tmp/FeedCatcher.tar.gz
echo "> Extracting Live FeedCatcher..."
tar -xzf /tmp/FeedCatcher.tar.gz -C /tmp
cp -r /tmp/FeedCatcher /usr/lib/enigma2/python/Plugins/Extensions
rm -r /tmp/FeedCatcher
rm -f /tmp/FeedCatcher.tar.gz
sleep 2
echo "========================================================="
echo "===                      FINISHED                     ==="
echo "===                Bahaa (Linuxcode)                  ==="
echo "========================================================="
echo "       FeedCatcher installed successfully!           "
echo "========================================================="
echo '*******************************************************'
sleep 3
if [ -f /etc/apt/apt.conf ] ; then
STATUS='/var/lib/dpkg/status'
OS='DreamOS'
elif [ -f /etc/opkg/opkg.conf ] ; then
STATUS='/var/lib/opkg/status'
OS='Opensource'
fi
if [ $OS = 'DreamOS' ]; then
systemctl restart enigma2
else
killall -9 enigma2
fi
exit 0
