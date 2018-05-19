# imagesToBase64
#### bundle 中的图片批量转为 base64 写入txt中
写入格式: 
`
static NSString*图片名=@"xxxxxxxx";
.....
`
<br>
使用用法:
```
 [Tool imagesToBase64WithBundleName:@"xxx.bundle" withToPath:@"/Users/xxx/Desktop/a.txt"];
```