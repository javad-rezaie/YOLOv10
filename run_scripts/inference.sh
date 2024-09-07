model_name=yolov10
job_name=yolov10_n_500e_coco # select a model

# WORKDIR in the created container is /home/PaddleYOLO, 

model_dir=/out/inference_model/${job_name}
inference_results_dir=/out/inference_results

# In the container, it is acceable as /data
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



image_path=/data/images/COCO_train2014_000000250645.jpg
#https://www.pexels.com/video/footage-of-a-woman-in-the-kitchen-3770018/
#video_path=/out/video/3770018-sd_960_540_25fps.mp4
CUDA_VISIBLE_DEVICES=0 python deploy/python/infer.py --model_dir=${model_dir} --image_file=${image_path} --output_dir=${inference_results_dir} --save_images=True --device=GPU
#CUDA_VISIBLE_DEVICES=0 python deploy/python/infer.py --model_dir=${model_dir} --video_file=${video_path} --output_dir=${inference_results_dir} --save_images=True --device=GPU

