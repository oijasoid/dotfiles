#!/usr/bin/env sh

if [ "$DUNST_URGENCY" == "CRITICAL" ]; then
	paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga
else
	paplay /usr/share/sounds/freedesktop/stereo/message.oga
fi
