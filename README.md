# YOLOv10 Object Detection with PAddleYOLO and Docker

This repository contains instructions for performing object detection tasks by training an YOLOv10 model using PAddleYOLO with Docker.

## Prerequisites

Before you begin, ensure you have Docker installed on your system. If not, you can install it by following the instructions [here](https://docs.docker.com/get-docker/).

## Getting Started

Clone this GitHub repository:

```bash
git clone https://github.com/javad-rezaie/YOLOv10
cd YOLOv10
```

## Setting Up the Docker Environment


Build Docker image by running:

```bash
make docker-build-paddle
```

## Dataset Preparation

1. Download the "COCO-Stuff 10K dataset v1.1" dataset from [cocostuff10k GitHub Repo](https://github.com/nightrome/cocostuff10k?tab=readme-ov-file).
2. Unzip the dataset and place it in a suitable directory.
3. Convert the dataset format to COCO format by following the steps described in `Data_Preparation.ipynb` Jupyter notebook.

To run the Jupyter notebook from the terminal, execute the `jupyter.sh` script:

```bash
bash jupyter.sh
```

## Modifying the Paths and GPU Configuration

1. Update the `DATA_DIR` path inside the `main_run.sh` script to your appropriate local path where the dataset is located.
2. Update the `GPU` variable to the number of installed GPUs on your PC.

### Data Structure

#### Local Machine

On your local computer, the data structure is as follows:

/mnt/SSD2/coco_stuff10k/ ├── images/ ├── train_coco.json └── test_coco.json


#### Container

Within the container, this directory is accessible as `/data` and will appear as:

/data/ ├── images/ ├── train_coco.json └── test_coco.json


The local path `/mnt/SSD2/coco_stuff10k/` is mapped to `/data/` inside the container.

## Train

```bash
bash main_run.sh train
```

## Evaluation

```bash
bash main_run.sh eval
```

## Export

```bash
bash main_run.sh export
```

## Inference

```bash
bash main_run.sh infer
```

## Disclaimer

This project is intended for educational purposes only. It is not intended to provide medical advice or any other professional advice. Any use of this project for real-world applications should be done with caution and proper consultation with relevant experts.

## License

This project is licensed under the This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
