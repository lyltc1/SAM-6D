# new terminal
conda activate sam6d
cd SAM-6D/
# (makedir if not prepared)
mkdir -p Data/BOP
mkdir -p Data/BOP-Templates
mkdir -p Data/MegaPose-Training-Data/MegaPose-ShapeNetCore/train_pbr_web
mkdir -p Data/MegaPose-Training-Data/MegaPose-GSO/train_pbr_web
mkdir -p Data/MegaPose-Training-Data/MegaPose-ShapeNetCore/templates
mkdir -p Data/MegaPose-Training-Data/MegaPose-GSO/templates
mkdir -p Data/MegaPose-Training-Data/MegaPose-GSO/google_scanned_objects
mkdir -p Data/MegaPose-Training-Data/MegaPose-ShapeNetCore/shapenetcorev2
# (or link if have prepared)
ln -s ~/eai_data/v-yonlin/Data/BOP Data/
ln -s ~/eai_data/v-yonlin/Data/BOP-Templates/ Data/
ln -s ~/eai_data/v-yonlin/Data/MegaPose-Training-Data/ Data

# new terminal
conda activate sam6d
cd Data/
python download_webdataset.py --dataset GSO

# new terminal
conda activate sam6d
cd Data/
python download_webdataset.py --dataset shapenet

# new terminal
conda activate sam6d
cd Data/
python download_models.py --dataset shapenet
unzip shapenetcorev2.zip -d .

# new terminal
conda activate sam6d
cd Data/
python download_models.py --dataset GSO
unzip google_scanned_objects.zip -d .

# download BOP-lm
cd Data/BOP
export SRC=https://huggingface.co/datasets/bop-benchmark/datasets/resolve/main
wget $SRC/lm/lm_base.zip         # Base archive with dataset info, camera parameters, etc.
wget $SRC/lm/lm_models.zip       # 3D object models.
wget $SRC/lm/lm_test_all.zip     # All test images ("_bop19" for a subset used in the BOP Challenge 2019/2020).
wget $SRC/lm/lm_train_pbr.zip    # PBR training images (rendered with BlenderProc4BOP).

unzip lm_base.zip             # Contains folder "lm".
unzip lm_models.zip -d lm     # Unpacks to "lm".
unzip lm_test_bop19.zip -d lm   # Unpacks to "lm".
unzip lm_train_pbr.zip -d lm  # Unpacks to "lm".
unzip lm_train.zip -d lm

# download BOP-ycbv
cd Data/BOP
export SRC=https://huggingface.co/datasets/bop-benchmark/datasets/resolve/main
wget $SRC/ycbv/ycbv_base.zip
wget $SRC/ycbv/ycbv_models.zip
wget $SRC/ycbv/ycbv_test_all.zip
wget $SRC/ycbv/ycbv_train_pbr.zip

unzip ycbv_base.zip
unzip ycbv_models.zip -d ycbv
unzip ycbv_test_all.zip -d ycbv
unzip ycbv_train_pbr.zip -d ycbv

# download BOP-hope
export LOCAL_DIR=./tmp/
export NAME=hope
huggingface-cli download bop-benchmark/datasets --include "$NAME/*" --local-dir $LOCAL_DIR --repo-type=dataset
# download BOP-template
