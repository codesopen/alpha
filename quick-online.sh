# 在线安装脚本
os=`uname -a`

# 支持MacOS
if [[ $os =~ 'Darwin' ]];then
    VERSION=$(curl -s https://github.com/alphaerp/alpha/releases/latest |grep -Eo 'v[0-9]+.[0-9]+.[0-9]+')
else
   # gitee curl -s https://gitee.com/alpha/releases | grep -Po 'v[0-9]+\.[0-9]+\.[0-9]' |  head -n 1
	VERSION=$(curl -s https://github.com/alphaerp/alpha/releases/latest/download 2>&1 | grep -Po 'v[0-9]+\.[0-9]+\.[0-9]+.*(?=")')
fi

# 支持wget下载
if which wget 1>/dev/null 2>/dev/null; then
   echo "检测到 wget 已安装，跳过安装步骤"
else
   echo "yum方式安装wget" 
   yum install -y wget
fi

# 下载软件包 (改成国内)
# wget --no-check-certificate https://github.com/alphaerp/alpha/releases/latest/download/alpha-release-${VERSION}.tar.gz
wget --no-check-certificate https://gitee.com$(curl -s https://gitee.com/opencodes-cn/res/releases | grep -Po /.*alpha-release-${VERSION}\.tar\.gz)
tar zxf alpha-release-${VERSION}.tar.gz

# 执行安装
cd alpha
sed -i -e "s#AL_VERSION=.*#AL_VERSION=${VERSION}#g" install.conf
/bin/bash install.sh
