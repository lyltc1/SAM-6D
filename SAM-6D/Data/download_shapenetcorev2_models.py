"""
    Download shapenetcorev2 which is 110G in total.
    This website does not support resuming downloads or multi-threaded downloading.
"""

import os
import zipfile

def download_url_zip(url, save_path):
    # Check if the file already exists and is a valid zip file
    if os.path.exists(save_path) and zipfile.is_zipfile(save_path):
        print("File already exists and is a valid zip file.")
    else:
        # Informing the user about the download initiation
        print("Starting download. This may take a while due to the file size and download restrictions.")
        print("The file will be saved at: ", save_path)
        # Removed the -c option as the server does not support resuming downloads
        command = f"wget '{url}' -O '{save_path}'"
        os.system(command)

# URL to the large dataset
url = "https://www.paris.inria.fr/archive_ylabbeprojectsdata/megapose/tars/shapenetcorev2.zip"
# Local path where the dataset will be saved
save_path = "shapenetcorev2.zip"

# Calling the function to start the download process
download_url_zip(url, save_path)