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

azcopy copy 'https://embodiedaidata.blob.core.windows.net/dataset2/v-yonlin/Data/BOP/MegaPose-Training-Data/MegaPose-GSO/google_scanned_objects/?sv=2023-01-03&spr=https%2Chttp&st=2024-07-19T03%3A48%3A36Z&se=2024-07-26T03%3A48%3A00Z&skoid=63a24da2-bb37-4f2b-95a1-4253e0f68a4a&sktid=72f988bf-86f1-41af-91ab-2d7cd011db47&skt=2024-07-19T03%3A48%3A36Z&ske=2024-07-26T03%3A48%3A00Z&sks=b&skv=2023-01-03&sr=c&sp=racwdxltf&sig=CGJZbxOrpB9UNiR6n2E7BsNwR5Lt4lbQBmIhUCv1vKg%3D' 'https://embodiedaidata.blob.core.windows.net/dataset2/v-yonlin/Data/MegaPose-Training-Data/MegaPose-GSO/?sv=2023-01-03&spr=https%2Chttp&st=2024-07-19T03%3A48%3A36Z&se=2024-07-26T03%3A48%3A00Z&skoid=63a24da2-bb37-4f2b-95a1-4253e0f68a4a&sktid=72f988bf-86f1-41af-91ab-2d7cd011db47&skt=2024-07-19T03%3A48%3A36Z&ske=2024-07-26T03%3A48%3A00Z&sks=b&skv=2023-01-03&sr=c&sp=racwdxltf&sig=CGJZbxOrpB9UNiR6n2E7BsNwR5Lt4lbQBmIhUCv1vKg%3D' --recursive

# new terminal
conda activate sam6d
cd Data/
python download_models.py --dataset GSO
unzip google_scanned_objects.zip -d .
azcopy copy ./google_scanned_objects 'https://embodiedaidata.blob.core.windows.net/dataset2/v-yonlin/Data/BOP/MegaPose-Training-Data/MegaPose-GSO?sv=2023-01-03&spr=https%2Chttp&st=2024-07-19T03%3A48%3A36Z&se=2024-07-26T03%3A48%3A00Z&skoid=63a24da2-bb37-4f2b-95a1-4253e0f68a4a&sktid=72f988bf-86f1-41af-91ab-2d7cd011db47&skt=2024-07-19T03%3A48%3A36Z&ske=2024-07-26T03%3A48%3A00Z&sks=b&skv=2023-01-03&sr=c&sp=racwdxltf&sig=CGJZbxOrpB9UNiR6n2E7BsNwR5Lt4lbQBmIhUCv1vKg%3D' --recursive

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
