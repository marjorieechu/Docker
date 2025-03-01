#!/bin/bash

service apache2 start

#keep the container running
tail -f /dev/null
