#
# Created on Sun Mar 31 2024
#
# Copyright (c) 2024 The Home Made AI (HOMAI)
# Author: Javad Rezaie
# License: Apache License 2.0
#

DATA_DIR="/mnt/SSD2/coco_stuff10k/" # In the container, it is acceable as /data
#Data Structure on my local computer is as follows:
#/mnt/SSD2/coco_stuff10k/
#├── images/
#├── train_coco.json
#└── test_coco.json

#It will be mapped to container, and it seems like:
#/data/
#├── images/
#├── train_coco.json
#└── test_coco.json

OUT_DIR="$PWD/out" # In the container, it is acceable as /out
RUN_SCRIPT_DIR=$PWD/run_scripts/ # In the container, it is acceable as /run_scripts


docker run -it --rm \
    --gpus all \
    --mount type=bind,source=$RUN_SCRIPT_DIR,target=/run_scripts \
    --mount type=bind,source=$DATA_DIR,target=/data \
    --mount type=bind,source=$OUT_DIR,target=/out \
    --shm-size 8g \
    paddle:latest \
    bash /run_scripts/$1