#!/bin/bash

# php scripts were downloaded earlier from fileUris in template
cp demo_*php /var/evo-webroot
chmod evostreamd:evostreamd /var/evo-webroot/demo_*php
