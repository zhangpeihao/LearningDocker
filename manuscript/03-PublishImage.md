# 发布镜像

在前面，我们已经提到，Docker不但提供了容器运行引擎，还提供了运行镜像的发布和管理平台[Docker Hub](http://hub.docker.com)。
在本章中，我们将学习Docker设计的镜像管理方式，并通过范例引导大家创建自己的仓库和镜像，使用这些镜像，大家可以方便的进行发布。

## Docker在镜像管理上的设计

Docker的镜像管理需要满足以下需求：
* 像软件仓库那样管理和保存镜像，具体的功能有：
 + 查询与下载安装；
 + 依赖关系的维护；
 + 发布和更新软件；
 + 授权与认证；
* Docker为了满足各种应用场景的需要提供不同类型的服务
 + 提供了Docker Hub作为官方的镜像管理平台，免费为普通用户提供开源的镜像管理服务，同时提供收费的私有镜像管理服务；
 + Docker也在github上将docker registry项目开源，让用户可以部署完全私有的镜像管理系统；
 + 另外，docker registry将认证与镜像管理分开，使用用户可以使用开发的镜像管理平台同时使用自己的索引服务（关于索引服务，在后面会进行介绍）；
* Docker为了适应各种部署需要，提供了S3, 云文件, 本地文件存储等各种存储后台

为了满足以上需求，Docker为镜像管理设计了以下几个概念：
* Index - 索引，Docker在索引服务中实现用户的授权与认证、镜像的CheckSum管理、以及公共命名空间的管理；
* Registry - 注册表（很难找到合适的词语来对应Registry，这里参考了一些其他Docker的中文翻译使用“注册表”，但是，Registry与Windows系统中的注册表概念完全不同。为了不误导读者，在本书中，我们将直接使用英文Registry），Docker通过Registry，将镜像和仓库的关系和版本管理与数据存储和授权认证分隔开，从而能够实现上面所提到的官方、镜像、私有和自认证等各种不同类型的服务。
* Repostory - 仓库，Docker中的仓库与Github上的仓库概念相同。我们在Registry上创建仓库，并在仓库中保存、记录和管理镜像与标签。
* Image - 镜像，Docker的镜像是仓库在运行环境下的一个实例。当然，也可以创建一个镜像不对应任何仓库，比如，你同样可以在本地为自己的image命名为zhangpeihao/learningdocker，但是你无法提交到Registry，因为Registry需要提交者拥有仓库zhangpeihao/learningdocker的权限。
* Tag - 标签，Docker提供标签来实现在一个仓库的不同版本。
* Layer - 层，Docker的镜像是在基础镜像之上进行扩充和修改的，包括基础镜像在内，每个扩充和修改都被看做是一个层。在数据保存上，层只保存扩充和修改的部分。
* Container - 容器，Docker容器是一个镜像个运行实例。容器在image之上增加了可写层。当在容器中修改了一个文件，那么Docker会先从镜像中把文件复制到可写层，然后在可写层对文件进行修改。

对于以上的这些概念，大家也许一下子无法理解透彻。没有关系，后面我们将通过在Docker上的实际操作，逐步理解这些概念。但是，通过这些概念，我们可以有一个认识：Docker通过将功能模块化，镜像层次化来满足Docker的各种功能和性能上的需求。

## 创建Docker Hub账号

Docker Hub是Docker官方提供的Register和Index服务。如果你身在中国大陆地区，在愉快的使用这一服务之前，需要先搭梯子，否则你可能无法完成某些操作。我正在尝试与Docker Hub反映这个问题，希望Docker Hub能做一些修改。

现在，先打开浏览器，输入网址：hub.docker.com，如果你以前没有登入过，将打开注册页面，如下图：

![](images/03_DockerHub/SignUp.jpg)

Docker Hub推荐使用GitHub账号进行注册，因为Docker Hub可以绑定GitHub账号，实现自动编译。虽然，你可以在后面手动绑定GitHub账号，但是，直接使用GitHub账号进行登入更方便。如果你还没有GitHub账号，请先访问[GitHub网站](https://github.com)，注册一个账号。按照提示输入GitHub的用户、密码以及Email地址，点击“Sign Up”按钮，进行注册。

注册成功后，进入个人首页，如下图：

![](images/03_DockerHub/main.jpg)

你可以通过左上角的Search功能在公共仓库中查找你需要的镜像。这里就不做深入介绍。后面我们还会学习到通过命令来查询镜像。

## 在Docker Hub上创建仓库

接下来，我们尝试在Docker Hub上创建一个仓库。在个人首页的左上角，有创建仓库的下拉菜单（如果你没有翻墙，这个下拉菜单可能打不开），打开菜单，如下图：

![](images/03_DockerHub/AddRepository.jpg)

菜单有两个选项，上面的"Repository"是用于创建仓库，下面的"Automated Build"用于创建自动编译项目。这里我们选择"Repository"，打开设置新仓库熟悉页面，如下图：

![](images/03_DockerHub/AddRepositoryDetail.jpg)

最上面是设置命名空间和仓库名，Docker Hub上命名空间使用用户名，仓库名只能是小写字母、数字、减号或下划线，这里我们输入："busybox"；下面是仓库的简介，输入："Sample repository"；最下面选择仓库的公开和私有熟悉。目前，Docker Hub为每一个账号提供了一个免费的私有仓库，这里，我们选择"Public"。点击"Add Repository"按钮，创建仓库，进入新仓库的首页，如下图：

![](images/03_DockerHub/busybox.jpg)

## 在命令行环境创建镜像

### 登入Docker Hub

现在，打开命令行环境，输入`sudo docker login -u`*`<用户名>`*` -p `*`<密码>`*` -e `*`<Email>`*
命令。如下图：

![](images/03_CreateImage/docker_login.jpg)

你也可以不带参数，Docker命令行客户端会提示你输入用户名、密码和Email。
你输入的登入信息会被发送到Docker Hub的索引服务进行身份认证。如果认证成功，你的认证信息会被保存在本地Home目录的.dockercfg文件里。

### 查询镜像

前面我们提到可以在Docker Hub网站查询镜像，在命令行环境同样可以进行查询。在命令行环境输入`sudo docker search busybox`命令。如下图：

![](images/03_CreateImage/docker_search.jpg)

查询命令发送到Docker Hub上索引服务。在前面我们已经提到，Docker使用索引服务处理索引仓库的查询请求。这里我们看到了很多与busybox有关的仓库，并且按照星数（点赞数）进行排序。

### 下载镜像

在前一章，我们已经尝试使用`docker pull`命令下载CentOS镜像。这里，我们下载busybox镜像，命令如下：

![](images/03_CreateImage/docker_pull.jpg)

我们下载的是官方命名空间下busybox镜像的最新Tag。下载过程中，我们可以看到，Docker命令行客户端并行的下载了很多个层(layer)。这些层是busybox镜像是通过将这些层串联起来得到的。

