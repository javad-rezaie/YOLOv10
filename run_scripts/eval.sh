model_name=yolov10
job_name=yolov10_n_500e_coco # select a model

# WORKDIR in the created container is /home/PaddleYOLO, 
config=configs/${model_name}/${job_name}.yml #Relative path to /home/PaddleYOLO
weights=/out/trained_model/${job_name}/model_final.pdparams

epoch=100
warmup_epoch=2
batch_size=4
worker_num=4
mosaic_epoch=90
snapshot_epoch=10
num_classes=182
base_lr=0.05

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

dataset_dir=/data
image_dir=images
train_anno_path=train_coco.json
eval_anno_path=test_coco.json
test_anno_path=test_coco.json


CUDA_VISIBLE_DEVICES=0 python tools/eval.py -c ${config} --classwise -o weights=${weights} \
num_classes=${num_classes} TrainReader.batch_size=${batch_size} TrainReader.mosaic_epoch=${mosaic_epoch} \
LearningRate.base_lr=${base_lr} \
TrainDataset.dataset_dir=${dataset_dir} TrainDataset.image_dir=${image_dir} TrainDataset.anno_path=${train_anno_path} \
EvalDataset.dataset_dir=${dataset_dir} EvalDataset.image_dir=${image_dir} EvalDataset.anno_path=${eval_anno_path} \
TestDataset.dataset_dir=${dataset_dir} TestDataset.anno_path=${eval_anno_path}



