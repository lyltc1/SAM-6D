import os
import tarfile
import argparse

def is_correct_tar(file_path):
    try:
        with tarfile.open(file_path) as file:
            return True
    except:
        return False

def download_url_tar(url, save_path):
    # Check if the file already exists and is a valid tar file
    if os.path.exists(save_path) and is_correct_tar(save_path):
        print(f"{save_path} already exists and is a valid tar file.")
    else:
        # Informing the user about the download initiation
        print("Starting download. This may take a while due to the file size and download restrictions.")
        print("The file will be saved at: ", os.path.abspath(save_path))
        # Removed the -c option as the server does not support resuming downloads
        command = f"wget '{url}' -O '{save_path}'"
        os.system(command)

# Create an argument parser
parser = argparse.ArgumentParser(description='Download webdataset files.')

# Add an argument for the dataset type
parser.add_argument('--dataset', type=str, choices=['GSO', 'shapenet'], help='Type of dataset to download')

# Parse the command line arguments
args = parser.parse_args()

SHARD_SIZE = 1040
if args.dataset == "GSO":
    base_url = 'https://huggingface.co/datasets/bop-benchmark/datasets/resolve/main/MegaPose-GSO/shard-{SHARD_ID:06d}.tar'
    base_path = 'MegaPose-Training-Data/MegaPose-GSO/train_pbr_web/shard-{SHARD_ID:06d}.tar'
elif args.dataset == "shapenet":
    base_url = 'https://huggingface.co/datasets/bop-benchmark/datasets/resolve/main/MegaPose-ShapeNetCore/shard-{SHARD_ID:06d}.tar'
    base_path = 'MegaPose-Training-Data/MegaPose-ShapeNetCore/train_pbr_web/shard-{SHARD_ID:06d}.tar'

for SHARD_ID in range(SHARD_SIZE):
    url = base_url.format(SHARD_ID=SHARD_ID)
    save_path = base_path.format(SHARD_ID=SHARD_ID)
    download_url_tar(url, save_path)
