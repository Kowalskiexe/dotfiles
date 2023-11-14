echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -E 's/Volume: //;s/()$/\1%/;s/([0-9])\./\1/;s/^0+//;s/^%$/0%/;s/.*MUTED.*/MUTED/')" >> "/tmp/audio2137"
echo 'updated'
