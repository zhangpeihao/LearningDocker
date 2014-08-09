# 简介

在Docker的官网，他们对Docker的定义是：

> Docker is an open platform for developers and sysadmins to build, ship, and run distributed applications. Consisting of Docker Engine, a portable, lightweight runtime and packaging tool, and Docker Hub, a cloud service for sharing applications and automating workflows, Docker enables apps to be quickly assembled from components and eliminates the friction between development, QA, and production environments. As a result, IT can ship faster and run the same app, unchanged, on laptops, data center VMs, and any cloud.
>
> Docker是为开发者和系统管理员提供的一套用于创建、发布和运行分布式应用的开放平台。它由Docker引擎（一个可移植的轻量级运行环境和打包工具）和Docker Hub（用于分享应用和提供自动化工作流的云服务）组成。Docker可以通过组件快速地组合成应用，并且减少开放、QA和发布环境之间的摩擦。最终，IT工程师能快速地将应用毫无更改地发布到笔记本、数据中心的虚拟机和所有的云环境上。

要理解Docker官网的这段话，我们需要了解网络应用的演变历程。

以Email为代表的早期网络应用，通常是由开发商按照标准开发，并运行在特定操作系统和硬件之上的服务。这种服务往往业务单一且固定，容量有限且不容易扩充。而另一方面，这些网络应用往往必须运行在特定操作系统、运行环境甚至硬件之上，这大大增加了网络应用的开发和运营成本。

随着网络基础设施的飞速发展，更多样的网络应用得以实现。服务提供商必须在竞争对手之前提供更加灵活可用、更加廉价、更大容量的新服务。这使得开发工程师与网络工程师在开发、升级、维护和扩展网络应用服务时遇到了前所未有的挑战。在上世纪90年代、Sun在兼并多家公司和项目之后，创造出运行在虚拟机之上的Java语言，这几乎实现了“让程序员写出能在任何计算机上运行”的梦想。就在今年（2014年）兼并了Sun公司的Oracle公司发布了最新的Java8。但是Java在性能、功能和开发速度等方面的局限使得Java在大部分领域无法满足业务需要，同时Java开发和发布时同样会遇到了版本兼容、运行环境复杂和升级困难的情况。为了能隔离出每个程序和系统合适的运行环境，同时最大限度的利用硬件资源，虚拟化技术得到了广泛应用。通过使用虚拟化技术，平台服务提供商大大简化了硬件设备的部署与维护工作。使得他们可以用更少的硬件和更少的维护人员为更多的客户提供统一高效的平台服务，Paas(Platform as a service)从此大行其道。在Paas的基础上，服务提供商也通过推行Saas(Software as a service)的概念，为用户提供更灵活和廉价的服务。

虚拟化技术自身经历了全虚拟化、半虚拟化和硬件辅助虚拟化的发展过程。随着Inter和AMD两家芯片巨头在硬件级别上对虚拟化给予越来越好的支持，虚拟化技术带来的性能损失正在逐渐减少。根据网上一些测评显示，虚拟化技术在整体性能上损失在40%左右<sup>1</sup>。在CPU性能、内存消耗和磁盘IO速度几个方面，虚拟化技术的损失各有不同。随着CPU对虚拟化支持程度的加大，CPU性能的损失变得越来越小。随着内存硬件技术的提升，内存消耗很少会成为系统瓶颈。而虚拟化技术在磁盘IO速度反面一直饱受争议。在网上，我找到了一篇专门对各种虚拟化产品和NSF进行磁盘IO性能测试的文章<sup>2</sup>。文章显示，虚拟化产品在访问共享文件时，性能出现巨大损失。这使得虚拟化技术在处理共享文件时存在巨大问题。

为了更好的利用宿主主机性能，更小的虚拟化损失，出现了操作系统级虚拟化技术。操作系统级虚拟化技术提供了一种轻量化的虚拟化实现方式。它与传统硬件虚拟化产品提供完全独立的操作系统内核不同，Linux容器使用宿主主机的操作内核，从而减少了在指令模拟、指令翻译和资源共享上的损失。

Docker正是在借鉴和总结chroot、OpenVZ和LXC等操作系统级虚拟化项目基础上，开发的一套系统全面的虚拟化应用技术平台。之所以称之为平台，是因为，Docker不只是一个程序或者软件。它始终将自己定位成提高资源使用率、降低开发和维护成本的平台。Docker不但提供了程序，还设计了一套完整的开发、部署和维护流程，并为之建立相应的平台支持。


