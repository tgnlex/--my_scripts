#!/bin/bash
PROGRAM=$(basename $0)
DATAFILE=packages.txt

# Can swap for browser of choice: 
# firefox, opera, google-chrome
BROWSER="firefox"
errors=0

cat "$DATAFILE" | while read line; do
  track=$(echo "$line" | awk '{print $1}')
  service=$(echo "$line" | awk '{print $2}')
  case "$service" in
    UPS)
      $BROWSER "https:wwww..com/track?tracknum=$track" &
      ;;
    FedEx)
      $BROWSER "https:wwww..com/fedextrack/?trknbr=$track" &
      ;;
    USPS)
      $BROWSER "https:wwww..com/go/TrackConfirmAction?tLabels=$track" &
      ;;
    *)
      >&2 echo "$PROGRAM: Unknown service '$service'"
      errors=1
      ;;
    esac
  done
  exit $errors  