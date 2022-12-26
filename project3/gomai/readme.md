## Some notes
1. 
        flag-part1: QURMezBLYWFzQU5fT
        P*`qtkX4}E3!I2g`Ks+ekKqxUb?"Zt')
        7Ah+V^W._;IT+Msw\|pX<[zchYw?bo(w
        M3v}SI6u,WUMHM7')ez0?{'Z:kJWUPd1
        j6,G;HUN|geVFxNw.yJ_~U<!(BZvVf=t
        }C'#l>Us;a<B:Dq~{z+ |!J.0#6K"voN
        I]xxp+BK*Vz}lu#OY?g\i"J#`]wMV6e5
        z@'S&e>8;V4@RFf=VuoCM6&n(~-86)lU
        W..|>azbOhlR@(Gi:)HwR.:SR?m>Zhg^
        Y&qexBK&@8fk7Ox{{m4xmzefR\,4B_aR
        e87Ikf_(:pJR6ho;PQ$*1bH+kddM>p F
    
2. (in style.css) /* flag-part2: jBfVDBNMERhY2hpX3 */

3. (in cookie) flag_part3: kwQjBrYXxodHRwczo

4. (in response header of inu.png) X-Secret-Message-FLAG-PART4: vL3lvdXR1LmJlL0l3

5. (in index.js) `var flagPart5 = console.log` flag-part5(t): SHd2LWxjeGk0fQ==

6. flag: **Base64_decoder(QURMezBLYWFzQU5fTjBfVDBNMERhY2hpX3kwQjBrYXxodHRwczovL3lvdXR1LmJlL0l3SHd2LWxjeGk0fQ==)**  
flag-part1 只有第一行有效，後面包含很多字元是 Base64 編碼不會出現的



- `console.log(parseInt('b0cc1', 18))` = 20859427，把 j 設為這個值後往下 scroll 會得到 SHd2LWxjeGk0fQ==

- t 是定值 SHd2LWxjeGk0fQ== (`flagPart5(t);`)

- t 應該是由 l 的某些 element 組合而成的字串，index 為 k 的 element
> `console.log(l)`:
flag-part1: QURMezBLYWFzQU5fT        P*`qtkX4}E3!I2g`Ks+ekKqxUb?"Zt')        7Ah+V^W._;IT+Msw\|pX<[zchYw?bo(w        M3v}SI6u,WUMHM7')ez0?{'Z:kJWUPd1        j6,G;HUN|geVFxNw.yJ_~U<!(BZvVf=t        }C'#l>Us;a<B:Dq~{z+ |!J.0#6K"voN        I]xxp+BK*Vz}lu#OY?g\i"J#`]wMV6e5        z@'S&e>8;V4@RFf=VuoCM6&n(~-86)lU        W..|>azbOhlR@(Gi:)HwR.:SR?m>Zhg^        Y&qexBK&@8fk7Ox{{m4xmzefR\,4B_aR        e87Ikf_(:pJR6ho;PQ$*1bH+kddM>p F
