### Create conda environment
conda env create -f environment.yaml
conda init
conda activate sam6d

### Install pointnet2
cd Pose_Estimation_Model/model/pointnet2
python setup.py install
cd ../../../

### Download ISM pretrained model
cd Instance_Segmentation_Model
python download_sam.py
python download_fastsam.py
python download_dinov2.py
cd ../

### Download PEM pretrained model
cd Pose_Estimation_Model
python download_sam6d-pem.py

### Install blender
wget https://download.blender.org/release/Blender3.3/blender-3.3.1-linux-x64.tar.xz
mkdir -p ~/blender
tar -xvf blender-3.3.1-linux-x64.tar.xz -C ~/blender/
rm blender-3.3.1-linux-x64.tar.xz
