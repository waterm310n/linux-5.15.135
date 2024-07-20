rm -f ./disk.img

dd if=/dev/zero of=./disk.img bs=1M count=256
mkfs.ext4 ./disk.img

mkdir -p ./mnt
sudo mount ./disk.img ./mnt
sudo mkdir -p ./mnt/lib
sudo mkdir -p ./mnt/home/cloud/study/glibc_top_riscv/lib/
sudo mkdir -p ./mnt/sbin
sudo mkdir -p ./mnt/bin
sudo mkdir -p ./mnt/tmp
sudo mkdir -p ./mnt/testcases
sudo cp ./lib/* ./mnt/lib/
sudo cp ./lib/* ./mnt/home/cloud/study/glibc_top_riscv/lib/
sudo cp ./sbin/* ./mnt/sbin/
sudo cp ./testcases/* ./mnt/testcases/
ls ./mnt/lib
ls ./mnt/sbin
ls ./mnt/testcases
sudo umount ./mnt
rm -rf ./mnt
