## Some Notes
1. Hint: ROP
2. ROP gadget:
    - `0x0000000000001eb3 : pop rdi ; ret` in Test_Subject_087
    - `0x0000000000023b6a : pop rdi ; ret` in libc-2.31.so

3. Challenge 裡面選取項目會用到 `rand() % something_list_len`，而 `something_list_len` 的值為看起來為固定 (每次執行都一樣)
4. 由 `init()` 裡面的 `srand(time(NULL));` 可知亂數種子為當下的時間，如果能夠產生相同的亂數序列就有可能通過 challenge，**但這樣提示沒有用到，也不會執行 shell**

5. `add_node()` 裡的 `strcpy()` 可以 overflow? => 看起來不能，src 的長度最大為 0x7f (前面的 read() 有限制)，dest 的空間大小為 0x80
6. `main()` 中會執行 `seccomp_rule_add()`，根據 [Linux Programmer's Manual](https://man7.org/linux/man-pages/man3/seccomp_rule_add.3.html)
`seccomp_rule_add()` 的作用為新增 seccomp(secure computing mode) filter rule，而 seccomp filter rule 可視為 syscall filter
> [Seccomp - HackTricks](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/docker-breakout/seccomp)

# Problems Encountered
1. 找不到可以 overflow 的 buffer
