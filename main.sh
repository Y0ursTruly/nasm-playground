echo "Enter path to nasm file: "
read -r path && cp "$path.nasm" ./t.nasm && nasm -felf64 t.nasm
gcc ./t.o -o t.out && ./t.out
rm t.nasm && rm t.o && rm t.out

# gcc -fno-asynchronous-unwind-tables -s -c -o "$path.o" "$path.c"
# objconv -fnasm "$path.o"
# those 2 lines above turn $path where $path.c is a c file to asm