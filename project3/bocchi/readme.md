## Some notes
1. `system("echo '" . $_POST['json'] . "'| jq .bocchi");` 看起來 system() 會回傳字串，但是不會顯示在網頁上，要透過 `<?php echo return value of system() ?>` 才會  
看起來像是 command injection 但 ';' '|' '&' 這些字元和 'cat' 'flag' 字串都不能出現在出入當中

2. 
```
The behavior of the system("echo '" . $_POST['json'] . "'| jq .bocchi"); command in PHP would depend on the specific context in which it is executed. The system() function in PHP is used to execute an external program and return the program's output. In this case, the echo command is being executed, which is a basic command that simply outputs the text that follows it. The $_POST['json'] part of the command specifies that the script should output the value of the json field in the $_POST array in PHP. The | jq .bocchi part of the command indicates that the script is piping the output of the echo command to the jq command, which is used for parsing and manipulating JSON data. The .bocchi part of the jq command may indicate that it is attempting to extract the bocchi field from a JSON document. Therefore, the behavior of this script would be to output the value of the bocchi field in the JSON document contained in the json field in the $_POST array. However, without more context it is difficult to say for certain what the behavior of this script would be.
```
> By ChatGPT of OpenAI

3. 輸入 '{"bocchi": `ls ../`}' 後 input tag 的 attribute value 會變得有點怪 <input name="json" value="{" bocchi": `ls="" ..="" `}"="">  
原來是不能有 " ，好像不能直接送 json 資料

4. 輸入 '{&#39bocchi&#39: &#39`ls`&#39}' 能使 attribute value of input tag 被設為 "{'bocchi': '`ls`'}" 但 '&' 在黑名單裡面

5. 輸入 `ls` 感覺能造成 command inejction，不過關鍵是 `system()` 的結果如果看不到的話感覺就沒戲唱

6. 嘗試用 python pwntool 來建立連線並輸入資料，結果一直得到 400 bad request

7. 經過 test.php 的測試發現若 ```$_POST['json'] = '{"bocchi": "`ls`"}';``` 則 ```system("echo '" . $_POST['json'] . "'| jq .bocchi");``` 會得到 ```"`ls`"``` ，並沒有執行 `ls` 這個指令，也就是 command injection 並沒有成功。 ```$_POST['json'] = '`ls`';``` 則會導致 parse error

### 嘗試輸入的字串
- {%22bocchi%22: %22ls%22}
- {bocchi: "Goto Hitori"}
- {"bocchi": "`ls`"} -> 無法達成 command injection
- {'bocchi': '`ls`'} -> syntax error
- %7B%22bocchi%22: %22ls%22%7D
- `ls` -> parse error
- '{"bocchi": ""`ls`"}' -> parse error
...
