model_name=yolov10
job_name=yolov10_l_500e_coco # select a model


config=configs/${model_name}/${job_name}.yml
log_dir=/out/log_dir/${job_name}
weights=https://bj.bcebos.com/v1/paddledet/models/${job_name}.pdparams
save_dir=/out/trained_model
epoch=50
batch_size=6
worker_num=4
mosaic_epoch=45
snapshot_epoch=10
num_classes=182
dataset_dir=/data
image_dir=images
train_anno_path=train_coco.json
eval_anno_path=test_coco.json
test_anno_path=test_coco.json
python -m paddle.distributed.launch --log_dir=${log_dir} --gpus 0,1 tools/train.py -c ${config} --eval --amp --use_vdl=True --vdl_log_dir=${log_dir} \
-o snapshot_epoch=${snapshot_epoch} save_dir=${save_dir} weights=${weights} epoch=${epoch} worker_num=${worker_num} \
num_classes=${num_classes} TrainReader.batch_size=${batch_size} TrainReader.mosaic_epoch=${mosaic_epoch} \
TrainDataset.dataset_dir=${dataset_dir} TrainDataset.image_dir=${image_dir} TrainDataset.anno_path=${train_anno_path} \
EvalDataset.dataset_dir=${dataset_dir} EvalDataset.image_dir=${image_dir} EvalDataset.anno_path=${eval_anno_path} \
TestDataset.dataset_dir=${dataset_dir} TestDataset.anno_path=${eval_anno_path}



