@echo off
rem -------------------------------------------------------------------------
rem
rem ʹ�ó���˵����
rem     ��ЩԶ�ֿ̲��ر��ֱ��clone������һ���ʱ���������п�����Ϊ���������жϣ�cloneʧ�ܡ�
rem     ����cloneԶ�˲ֿ��ĳ���ļ����Ǳ�Ҫ��,�ýű�����git clone ָ���ļ��л򵥸��ļ���
rem
rem ʹ������˵����gitclone <url> <target>
rem 
rem ʹ�ò���˵����
rem     1: url        Զ�ֿ̲��ַ
rem     2: target_dir ��clone��Զ�ֿ̲�ָ��Ŀ¼���ļ�,���ж�Ŀ¼���ļ����ŷ��ŷָ
rem     3: repo_name  �����ڱ��صĲֿ�����,Ĭ�ϴ�urlȡ�ֿ�����
rem
rem ʹ�ýű��������ӣ�gitclone.bat https://github.com/mygithub/test dir1/dir2/
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
        ::��url��ȡ�ļ�������
        for %%a in ("%url%") do (
            for %%b in ("%%~pna.") do (
                set repo_name=%%~nxb
            ) 
        ) 
    )
)

::�����ֿ��Ŀ¼
cd %pull_path%
if not exist %repo_name% md %repo_name% 

::��ʼ���ֿ�
cd %pull_path%%repo_name%
git init
git config core.sparsecheckout true

::ѭ��������˵��ļ��л��ļ�
echo =================�����ļ��嵥=================
set remain=%target_dir%
:loop
for /f "tokens=1* delims=:" %%a in ("%remain%") do (
    echo %%a
    echo %%a >> .git/info/sparse-checkout
    set remain=%%b
)
::�������ʣ��,������ָ�
if defined remain goto :loop
echo =============================================

::����Զ�ֿ̲�����
git remote add origin %url%
echo ����Զ�ֿ̲���ȡ...
git pull --depth=1 origin master
echo ��ȡ��ϣ��ļ������棺%pull_path%%repo_name%






