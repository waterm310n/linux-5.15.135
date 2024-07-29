QEMU=../qemu/build/qemu-system-riscv64
#QEMU=qemu-system-riscv64

if [ $# -ne 1 ]; then
  echo "$0 [app_name]";
  exit;
fi

${QEMU} -m 128M -smp 1 -machine virt \
-bios default -kernel ./output/vmlinuz-5.15.135+ \
-device virtio-blk-device,drive=disk0 -drive id=disk0,if=none,format=raw,file=./payload/disk.img \
-nographic -append "earlycon=sbi root=/dev/vda rw console=ttyS0 init=$1"
#-nographic -append "earlycon=sbi root=/dev/vda rw console=ttyS0" -D qemu.log -d int
#-nographic -append "earlycon=sbi root=/dev/vda rw console=ttyS0 init=/sbin/mmap" -D qemu.log -d in_asm,int
#-nographic -append "earlycon=sbi root=/dev/vda rw console=ttyS0 init=/sbin/sh" -D qemu.log -d in_asm,int
#-nographic -append "earlycon=sbi root=/dev/vda rw console=ttyS0 init=/testcases/mmap01" -D qemu.log -d in_asm,int
#-nographic -append "earlycon=sbi root=/dev/vda rw console=ttyS0" -D qemu.log -d in_asm,int
