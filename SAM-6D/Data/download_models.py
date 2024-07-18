"""
    Download models for GSO, BOP, or ShapeNet from megapose.
    This website does not support resuming downloads or multi-threaded downloading.
"""

import os
import zipfile
import argparse

def download_url_zip(url, save_path, args_extract=False):
    # Check if the file already exists and is a valid zip file
    if os.path.exists(save_path) and zipfile.is_zipfile(save_path):
        print("File already exists and is a valid zip file.")
    else:
        # Informing the user about the download initiation
        print("Starting download. This may take a while due to the file size and download restrictions.")
        print("The file will be saved at: ", os.path.abspath(save_path))
        # Removed the -c option as the server does not support resuming downloads
        command = f"wget '{url}' -O '{save_path}'"
        os.system(command)

# Create an argument parser
parser = argparse.ArgumentParser(description='Download dataset.')

# Add an argument for choosing the dataset
parser.add_argument('--dataset', type=str, required=True, choices=["BOP", "GSO", "shapenet"], help='Choose the dataset to download.')
parser.add_argument('--extract', action='store_true', help='Extract the downloaded zip file.')
# Parse the command line arguments
args = parser.parse_args()

# Check the value of args.dataset and perform the corresponding download
if args.dataset == "BOP":
    url = "https://www.paris.inria.fr/archive_ylabbeprojectsdata/megapose/tars/bop_models_panda3d.zip"
elif args.dataset == "GSO":
    url = "https://www.paris.inria.fr/archive_ylabbeprojectsdata/megapose/tars/google_scanned_objects.zip"
elif args.dataset == "shapenet":
    url = "https://www.paris.inria.fr/archive_ylabbeprojectsdata/megapose/tars/shapenetcorev2.zip"
else:
    raise ValueError("Invalid dataset choice. Please choose from {'BOP', 'GSO', 'shapenet'}.")
save_path = url.split("/")[-1]

download_url_zip(url, save_path, args.extract)