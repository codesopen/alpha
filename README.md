# 分享常用脚本工具库

### Centos - Docker容器便捷部署管理软件

***

### Docker - 青龙脚本管理系统搭建

1. 执行ql-docker-compose.yml
   ```powershell
   docker-compose -f ql-docker-compose.yml up -d
   ```
2. 配置QQ邮箱通知
  `QQ --- 用户名 ---- SMTP授权码`
3. 配置pmpn环境变量（否则依赖管理安装不了插件，重启容器生效）
   ```powershell
   ## 其他需要的变量，脚本中需要的变量使用 export 变量名= 声明即可
   export PNPM_HOME="/root/.local/share/pnpm"
   ```
4. 安装NodeJs常用插件
   ```
   crypto-js
   prettytable
   dotenv
   fs
   require
   axios
   date-fns
   js-base64
   tslib
   tough-cookie
   jsdom
   typescript
   ws@7.4.3
   ts-md5
   jieba
   form-data
   json5
   global-agent
   png-js
   @types/node
   ```
5. 拉取京东脚本仓库
【添加环境变量】
  ```
   名称：JD_COOKIE
   值：pt_key=n-lgwvGDCQOzM;pt_pin=136***_m;&pt_key=AAJiRxFrP1v-w;pt_pin=net_mx_m;
  ```
【添加订阅管理】
  ```
   名称：faker2
   链接：https://github.com/shufflewzc/faker2.git
   定时类型： interval
   定时规则：每1天
   白名单：jd_|jx_|gua_|jddj_|jdCookie
   黑名单：activity|backUp
   依赖文件：^jd[^_]|USER|function|utils|sendNotify|ZooFaker_Necklace.js|JDJRValidator_|sign_graphics_validate|ql|JDSignValidator
  ```
【配置助力码】
   ```
   1) 下载脚本执行命令：ql repo https://github.com/alphaerp/alpha.git "code.sh|task_befor.sh"
   2) 将code.sh和task_befor.sh放入[/ql/data/config/]文件夹目录下
   3) 检查jdCookie.js内容里的shareCodeLogPath变量路径是否正确
   4) 执行task /ql/data/config/code.sh
   ```
