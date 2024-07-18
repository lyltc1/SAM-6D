# new terminal
conda activate sam6d
cd SAM-6D/
mkdir -p Data/BOP
mkdir -p Data/BOP-Templates
mkdir -p Data/MegaPose-Training-Data/MegaPose-ShapeNetCore/train_pbr_web
mkdir -p Data/MegaPose-Training-Data/MegaPose-GSO/train_pbr_web
mkdir -p Data/MegaPose-Training-Data/MegaPose-ShapeNetCore/templates
mkdir -p Data/MegaPose-Training-Data/MegaPose-GSO/templates
mkdir -p Data/MegaPose-Training-Data/MegaPose-GSO/google_scanned_objects
mkdir -p Data/MegaPose-Training-Data/MegaPose-ShapeNetCore/shapenetcorev2

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

# new terminal
conda activate sam6d
cd Data/
python download_models.py --dataset GSO