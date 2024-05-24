#!/bin/bash
set -e
docker pull anilkumare/cal
docker run -dt --name calu -P anilkumare/cal
