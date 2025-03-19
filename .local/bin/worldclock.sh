#! /usr/bin/env sh

# worldclock.sh

yad --width=640 --height=480 --center --fixed --no-buttons \
    --timeout=60 --timeout-indicator=bottom \
    --title="World Clock" --list --no-click \
    --column="Location" --column="Local Time" \
    "Berlin" "$(TZ=Europe/Berlin date '+%a %-d %b %Y %-H:%M %Z')" \
    "Bogotá" "$(TZ=America/Bogota date '+%a %-d %b %Y %-H:%M %Z')" \
    "Buenos Aires" "$(TZ=America/Argentina/Buenos_Aires date '+%a %-d %b %Y %-H:%M %Z')" \
    "Lisboa" "$(TZ=Europe/Lisbon date '+%a %-d %b %Y %-H:%M %Z')" \
    "London" "$(TZ=Europe/London date '+%a %-d %b %Y %-H:%M %Z')" \
    "México" "$(TZ=America/Mexico_City date '+%a %-d %b %Y %-H:%M %Z')" \
    "New Delhi" "$(TZ=Asia/Kolkata date '+%a %-d %b %Y %-H:%M %Z')" \
    "Phoenix" "$(TZ=America/Phoenix date '+%a %-d %b %Y %-I:%M %p %Z')" \
    "São Paulo" "$(TZ=America/Sao_Paulo date '+%a %-d %b %Y %-H:%M %Z')" \
    "Singapore" "$(TZ=Asia/Singapore date '+%a %-d %b %Y %-H:%M %Z')" \
    "Taipei" "$(TZ=Asia/Taipei date '+%a %-d %b %Y %-H:%M %Z')" \
    "Tel Aviv" "$(TZ=Asia/Tel_Aviv date '+%a %-d %b %Y %-H:%M %Z')" \
    "US Central" "$(TZ=US/Central date '+%a %-d %b %Y %-I:%M %p %Z')" \
    "US Eastern" "$(TZ=US/Eastern date '+%a %-d %b %Y %-I:%M %p %Z')" \
    "US Mountain" "$(TZ=US/Mountain date '+%a %-d %b %Y %-I:%M %p %Z')" \
    "US Pacific" "$(TZ=US/Pacific date '+%a %-d %b %Y %-I:%M %p %Z')"