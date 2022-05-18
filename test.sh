#!/bin/bash

youtube-dl 'https://www.youtube.com/watch?v=f-R9lGvSLI4'
mv *.mp4 /var/www/html

echo 'coucou'

/usr/sbin/apache2ctl -DFOREGROUND

exit 0
