@echo off
rem -------------------------------------------------------------------------
rem
rem 使用场景说明：
rem     有些远程仓库特别大，直接clone下来，一则耗时长，二则有可能因为网络问题中断，clone失败。
rem     所以clone远端仓库的某个文件夹是必要的,该脚本用于git clone 指定文件夹或单个文件。
rem
rem 使用命令说明：gitclone <url> <target>
rem 
rem 使用参数说明：
rem     1: url        远程仓库地址
rem     2: target_dir 待clone的远程仓库指定目录或文件,其中多目录或文件逗号符号分割，
rem     3: repo_name  保存在本地的仓库名称,默认从url取仓库名称
rem
rem 使用脚本命令例子：gitclone.bat https://github.com/mygithub/test dir1/dir2/
rem -------------------------------------------------------------------------

set pull_path=D:\
set url=
set target_dir=
set repo_name=

if NOT "%1" == "" ( set url=%1 )
if NOT "%2" == "" ( set target_dir=%2 )
if NOT "%3" == "" ( set repo_name=%3
) else (
    if "%repo_name%" == "" ( 
        ::从url提取文件夹名称
        for %%a in ("%url%") do (
            for %%b in ("%%~pna.") do (
                set repo_name=%%~nxb
            ) 
        ) 
    )
)

::创建仓库根目录
cd %pull_path%
if not exist %repo_name% md %repo_name% 

::初始化仓库
cd %pull_path%%repo_name%
git init
git config core.sparsecheckout true

::循环输出过滤的文件夹或文件
echo =================下载文件清单=================
set remain=%target_dir%
:loop
for /f "tokens=1* delims=:" %%a in ("%remain%") do (
    echo %%a
    echo %%a >> .git/info/sparse-checkout
    set remain=%%b
)
::如果还有剩余,则继续分割
if defined remain goto :loop
echo =============================================

::关联远程仓库链接
git remote add origin %url%
echo 正在远程仓库拉取...
git pull --depth=1 origin master
echo 拉取完毕，文件被保存：%pull_path%%repo_name%






