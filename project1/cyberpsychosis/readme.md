## Some Notes
1. Hint: GOT
2. 在 `show_info()`, `edit_info()` 裡輸入小於 0 的整數 (e.g. -1) 會通過檢查，不會執行 `puts("Invalid index!!")`
3. 在 `edit_info()` 裡面 `printf("Implant value: ");` 之後的輸入看來是關鍵，輸入的內容讀進變數後會被帶入 `atol()` 執行
4. 由 1. & 3. 猜測可能要將 GOT 裡 `atol()` 對應的 function pointer 指到 `system()` => `atol()` 的 GOT entry 看來在 0x405068
```
(gdb) x/gx 0x405068
    0x405068 <atol@got.plt>:        0x00007ffff7e045d0
```
0x00007ffff7e045d0 為 `atol()` 在 libc 的位址
```
(gdb) x/gi 0x00007ffff7e045d0
    0x7ffff7e045d0 <atol>:       endbr64
```
若在尚未執行前查看 此 GOT entry
`0x405068 <atol@got.plt>:        0x00000000004010d0`
會先跳到 0x4010d0 

```
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	68 0a 00 00 00       	push   0xa
  4010d9:	f2 e9 41 ff ff ff    	bnd jmp 401020 <.plt>
```
看來是 GOT 中的第 a 個 entry (index 由 0 開始)

在 objdump 的輸出中可以看到 405000 為 GOT 的地址

5. 最後再進到 `edit_info()` 輸入 "/bin/sh" 以執行 `system("/bin/sh")`

## Problems Encountered
1. 如何將 0x405068 上面的內容改為 `system()` 的位址? 
    - 看不出有透過 buffer overflow 來達成的可能性
    - implant name 輸入與此有關，limb index 輸入 -2 的話從 0x405060 開始的 20 bytes 會是 implant name `read()` 的目標，若先填入 '0' * 8，後面填入 `system()` 的位址就能達成第一個目標 (將 GOT 裡 `atol()` 的 function pointer 指到 `system()`)
        
2. **如何找出 `system()` 的位址?** 可以透過 pwntool 直接找到 offset (0x52290)，還需要 leak 出 libc 的 base address 才行
    - `show_info()` 會印出 implant name，limb index 輸入 -2 的話**從 0x405060 開始印，似乎能 leak 出一些 libc function 資訊?!**
    - `show_info()` 會印出 limb name，limb index 輸入 -2 的話**從 0x405040 開始印，成功拿到 `read()` 的位址
    ```
    str = p.recvline()
    print('the following line is the address of read()')
    read_addr = u64(str[11:17] + b'\x00\x00')
    ```
    ```
    the following line is the address of read()
    b'\xc0\x7f\xfe\xd9\xd4\x7f\x00\x00'
    7FD4D9FE7FC0
    ```
    將 read_addr - read_offset (0x10dfc0) 可得 **libc offset**，達成目標

**Solved**
