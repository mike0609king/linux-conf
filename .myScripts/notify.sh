#!/bin/zsh

# Article
# How to Send Push Notifications to Your Phone From Any Script
# https://betterprogramming.pub/how-to-send-push-notifications-to-your-phone-from-any-script-6b70e34748f6

arg=$(echo $1 | sed 's/ /%20/g')
curl -s -o /dev/null "https://maker.ifttt.com/trigger/notify/with/key/pjGwKvdEDNdq6LS8E7DUYxAHBEqVcOlttIM8npGyFst?value1=$arg"
