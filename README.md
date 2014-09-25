# 学习Docker

by 章培昊(Zhang Peihao)

本书将尽力为希望了解Docker的读者提供一个系统的引导。读者可以根据自己的需要选择性地阅读相应内容，但我建议初学Docker的读者，特别是服务器部署方面经验不太丰富的读者能尽量按照本书的组织，循序渐进地了解Docker。

本书的目标读者是有一定服务器管理经验的网络工程师。我会在书中尽可能详尽地记录下操作的命令和脚本内容，如果在操作或执行命令时没有得到书中描述的结果，可能是由于执行环境（操作系统版本、网络连接情况等等）的差别造成的，你可以通过提交问题或者加入讨论群来寻求帮助。

本书目前还处于撰写状态，如果你希望加入我们，欢迎你发送邮件到（zhangpeihao@gmail.com），请在标题注明：参与《学习Docker》的撰写，并在邮件中提供你希望参与撰写的内容。

## 排版约定

本书使用以下排版约定：

* *斜体字*

	等宽斜体字用来标示读者需要将文本替换成自己的内容。

* `等宽字`

    代码使用等宽字体，并按照响应语法进行着色。例如：
	```go
	func LearningDocker(bookname string) {
		fmt.Printf("%s is the best book to learn Docker!\n", bookname)
	}
	```


## 目录

+ [简介](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/00-Introduction.md)

+ [下载与安装](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/01-DownloadAndInstall.md)

    - [Windows环境下安装Docker](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/01-DownloadAndInstall.md#windows%E7%8E%AF%E5%A2%83%E4%B8%8B%E5%AE%89%E8%A3%85docker)

    - [MacOS环境下安装Docker](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/01-DownloadAndInstall.md#macos%E7%8E%AF%E5%A2%83%E4%B8%8B%E5%AE%89%E8%A3%85docker)

    - [CentOS6环境下安装Docker](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/01-DownloadAndInstall.md#centos6%E7%8E%AF%E5%A2%83%E4%B8%8B%E5%AE%89%E8%A3%85docker)

    - [CentOS7环境下安装Docker](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/01-DownloadAndInstall.md#centos7%E7%8E%AF%E5%A2%83%E4%B8%8B%E5%AE%89%E8%A3%85docker)

    - [Ubuntu Server14.04环境下安装Docker](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/01-DownloadAndInstall.md#ubuntu-server1404%E7%8E%AF%E5%A2%83%E4%B8%8B%E5%AE%89%E8%A3%85docker)

+ [创建第一个容器](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/02-CreateFirstContainer.md)

+ [发布镜像](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/03-PublishImage.md)

+ [编写Dockerfile]
(https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/04-WriteDockerfile.md)

TODO: Docker命令详解

TODO: Dockerfile命令详解

TODO: 使用Docker创建你的Web应用

TODO: 从源代码编译Docker

TODO: LXC与libcontainer

## 讨论群

大家可以加入QQ群（94585507）讨论Docker相关话题

## 版权申明

Copyright 2014 Zhang Peihao

本书内容使用版权申明[CC BY-NC-ND 3.0 License](http://creativecommons.org/licenses/by-nc-nd/3.0/)。

![Creative Commons License](http://i.creativecommons.org/l/by-nc-nd/3.0/88x31.png)
