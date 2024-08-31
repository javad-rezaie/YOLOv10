#
# Created on Sun Mar 31 2024
#
# Copyright (c) 2024 The Home Made AI (HOMAI)
# Author: Javad Rezaie
# License: Apache License 2.0
#

DATA_DIR="/mnt/SSD2/coco_stuff10k/"
OUT_DIR="$PWD/out"
RUN_SCRIPT_DIR=$PWD/run_scripts/


docker run -it --rm \
    --gpus all \
    --mount type=bind,source=$RUN_SCRIPT_DIR,target=/run_scripts \
    --mount type=bind,source=$DATA_DIR,target=/data \
    --mount type=bind,source=$OUT_DIR,target=/out \
    --shm-size 8g \
    paddle:latest \
    bash /run_scripts/$1