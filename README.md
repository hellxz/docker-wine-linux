# docker-wine-linux
[![](https://img.shields.io/badge/Linux-All_distro-green.svg)](https://www.gnu.org)
[![](https://img.shields.io/badge/deepin_wine-2.08|THE_BASIC_ENVIRONMENT-red.svg](https://winehq.org)
[![](https://img.shields.io/badge/docker-18.09-blue.svg)](https://www.docker.com)
[![](https://img.shields.io/badge/Ubuntu-latest|FOR_DOCKER_IMAGE-orange.svg)](https://www.ubuntu.com)
![](https://img.shields.io/github/stars/RokasUrbelis/docker-wine-ubuntu.svg?label=Stars&style=social)
# 一、项目介绍
>Deepin-wine环境的全Linux发行版的移植版（支持所有Linux发行版）

>使用deepin原版二进制文件，解决依赖问题

>使用docker作为运行容器，方便管理、删除、卸载、打包、迁移等

>应用使用过程中传输的文件全部保存在容器`~/.deep-wine/`的子目录

>仅供个人研究学习使用,谢绝无版权声明造轮子

## 运行必要条件
- 操作系统:Linux
- 应用软件:Docker

***如果你的系统未安装docker，请先执行以下命令安装docker:***
```shell
curl -fsSL https://get.docker.com|bash
# 如果使用此命令依旧安装不了，请移步至docker官网查看安装文档。
```
#### 由于docker需要系统要求内核版本至少高于`2.6.32`上，如果内核未达标，请自行编译内核，可参考[此链接](https://blog.linux-code.com/articles/thread-1006.html)

# 二、获取并安装
```shell
# Clone this repository
git clone https://github.com/RokasUrbelis/docker-wine-linux.git

# Go into the repository
cd docker-wine-linux

# Build docker image and run docker container for first time
bash run.sh
``` 
>因为需要构建docker镜像和克隆deepin-wine-ubuntu，第一次执行run.sh的时间较长，此时你去外面遛弯都是没问题的


# 三、运行及使用说明

#### (1):rocket:目前只测试了`QQ/TIM/百度网盘/迅雷极速版/Foxmail`几个应用，如果你想自定义安装你需要的软件，可以到[阿里云镜像下载](http://mirrors.aliyun.com/deepin/pool/non-free/d/)对应deb包，`mv`到`deb`目录，之后再执行`bash run.sh`。
> 提醒一句，因为那些包是针对deepin开发的，用在Ubuntu镜像，使用过程中出现的任何意外情况都是正常的，不保证全部可以正常使用，除非确实有用的需求，否则不建议使用。我测试的这几个应用是毫无问题的。

#### 如果没有需求请直接执行:
```shell
bash run.sh
```
#### (2):zap:执行run.sh后会自动创建容器并后台运行，并且会告诉你容器id以及给出相应的命令让你执行,你可以执行它给出的命令来运行应用（默认是运行TIM)，执行格式为:
```shell
source start.sh -i 容器id 应用名
#执行完此命令可能需要等待10-30秒钟，取决于系统响应速度
```
>应用名列表可执行`bash start.sh --help`查看帮助，应用名不区分大小写亦可运行

#### (3):bulb:重要提示:
- 因为wine有时候不稳定，运行完应用后发现登录上去看不到页面或者鼠标无法点击或者出现崩溃的情况都是正常的，因为第一次见到主人，wine很害羞(多运行一两次就正常了)，此时你需要kill掉后台pid或者删除容器来释放系统资源或者直接重新运行`run.sh`。
- 推荐每个wine应用使用单独容器运行(即每次运行应用前先运行run.sh)，而不是集中在一个容器上，这样方便管理并且降低崩溃概率。
#### (4):label:文件路径问题
- 执行完`run.sh`后会生成一个`APP_PATH`目录，此文件夹已经映射到了你当前容器的`/root`目录，使用应用过程中传输的文件也全部保存在`APP_PATH`这个文件夹里面,多次运行容器或者应用也不会影响文件存放路径。

# 四、支持的应用
#### :trophy:目前支持的应用有(持续更新):
- QQ
- TIM
- Wechat
- 百度网盘
- 迅雷急速版
- Foxmail

# 五、卸载方法
- 执行`bash uninstall.sh`即可

# 六、鸣谢
#### 项目主要参考[deepin-wine-ubuntu](https://github.com/wszqkzqk/deepin-wine-ubuntu)(此项目主要是针对Ubuntu开发)，我只是通过容器与宿主机结合让它能在所有发行版中使用。如果我看的更远一点的话，是因为我站在巨人的肩膀上。
  
# 七、参与贡献
- Star/Fork本项目
- 新建 Feat_xxx 分支
- 提交代码
- 新建 Pull Request
      
# 八、运行截图 
#### 以下是在Debian上的运行截图(其他发行版也都是支持的):
##### (百度网盘&TIM)
![百度网盘&TIM](https://raw.githubusercontent.com/RokasUrbelis/docker-wine-ubuntu/master/screen/screen01.png)
##### (迅雷&WeChat)
![迅雷&WeChat](https://raw.githubusercontent.com/RokasUrbelis/docker-wine-ubuntu/master/screen/screen02.png)
##### (3D视图)
![3D视图](https://raw.githubusercontent.com/RokasUrbelis/docker-wine-ubuntu/master/screen/screen03.png)
#### 此项目使用[deepin-wine-ubuntu](https://github.com/wszqkzqk/deepin-wine-ubuntu)作为基础环境，ubuntu:latest作为docker容器，构建了一套容器上运行应用，并把图形化输出到宿主机的DISPLAY控制器的docker容器，支持所有发行版。

