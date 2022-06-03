# 分享常用脚本工具库

### Centos - Docker容器便捷部署管理软件
快速安装条件：
1. 准备一台4G内存且64位的Centos Linux 主机，推荐使用阿里云ECS;
2. 请以 root 用户执行如下命令一键安装;
``` 
curl -sSL https://github.com/alphaerp/alpha/releases/latest/download/quick-online.sh | sh
```
##### 注意事项：
1. 编写的编排文件命名规范为[服务名-docker-compose.yml];
2. yml文件需存放在/opt/alpha/docker-composes文件夹下；
3. 一个yml文件尽可能只编写一个服务，然后用alpha-cli命令管理容器；
##### alpha-cli语法：
```
alpha-cli [服务名] [commands]"
  commands:
  status       查看所有服务运行状态"
  start         启动服务"
  stop         停止服务"
  restart      重启服务"
  reload      重新加载服务"
  upgrade   升级至最新版本"
  uninstall   卸载服务"
```
##### 举个栗子创建nginx容器，容器服务名定义为nginx，对应的文件名应需是nginx-docker-compose.yml。执行命令 alpha-cli nginx upgrade 

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
   3) 检查jdCookie.js内容里的shareCodeLogPath变量路径是否正确(正确完整路径/ql/data/log/.SharenCode/**.log)
   4) 执行task /ql/data/config/code.sh
   ```
