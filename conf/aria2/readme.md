Aria2
=====


aria2 is a utility for downloading files. The supported protocols are HTTP(S), FTP, SFTP, BitTorrent, and Metalink. aria2 can download a file from multiple sources/protocols and tries to utilize your maximum download bandwidth. It supports downloading a file from HTTP(S)/FTP /SFTP and BitTorrent at the same time, while the data downloaded from HTTP(S)/FTP/SFTP is uploaded to the BitTorrent swarm. Using Metalink chunk checksums, aria2 automatically validates chunks of data while downloading a file.

aria2 是一款支持多种协议的轻量级命令行下载工具。有以下特性：

- 多线程连线：aria2 会自动从多个线程下载文件，并充分利用你的带宽；
- 轻量：运行时不会占用过多资源，根据官方介绍，内存占用通常在 4MB~9MB，使用 BitTorrent 协议，下行速度 2.8MB/s 时 CPU 占用率约 6%；
- 全功能 BitTorrent 客户端；
- 支持 RPC 界面远程控制

----

Arch Linux:

	sudo pacman -Syu aria2

Ubuntu:

	sudo apt-get install aria2
	
Mac:

	sudo brew install aria2
	
----

aria2提供两种方式使用，一种是直接命令行模式下载，不推荐使用这种方法，推荐使用另外一种RPC模式，这种方式aria启动之后只会安静的等待下载请求，下载完成后也只会安静的驻留后台不会自动退出。而使用RPC模式推荐做一个配置文件方便使用。把配置文件放在 ~/.aria2下。

* 直接使用
	
		$ aria2c https://cdn.kernel.org/pub/linux/kernel/v2.6/longterm/v2.6.32/linux-2.6.32.69.tar.xz
	
* RPC模式
	
		$ aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all -c -D
		
	但是这种命令不好，配置不方便保存，并且使用`-D`（后台运行）就无法看到错误信息。
	
	因此推荐启动方式是使用配置文件 $HOME/.aria2/aria2.conf
	
		cd ~
		mkdir .aria2
		cd .aria2
		touch aria2.conf
		touch aria2.session


	aria2的配置写在aria2.conf中，只需要更改下载目录dir与预分配方式file-allocation，其他配置可以不更改。

	启动:
	
		$ aria2c --conf-path="/Users/xxx/.aria2/aria2.conf" -D

	建议先不要添加`-D`选项，以查看是否运行正常。
	
	由于默认的aria2是不带GUI的，所以需要一个WEB UI。    
	可以选择使用web页面或自己搭建web:
	
	* 访问web页面:

		[http://ziahamza.github.io/webui-aria2/]    
		[http://aria2c.com/]
		打开页面后，配置IP与端口号，即可连接对应的aria2.
	* 搭建web:
		
		1. 安装Apache服务器
			
				$ sudo apt-get install apache2 
		2. Apache默认的http根目录是在/var/www目录下(Arch Linux为/srv/http)，下载web UI，拷贝到该目录

				git clone https://github.com/ziahamza/webui-aria2
				mv webui-aria2 /var/www
			直接访问localhost:80即可。
	
	* [Chrome插件(YAAW下载管理器)](https://chrome.google.com/webstore/detail/yaaw/hbjpfaalboebibgfmedmjijhbjapcnki)     
		YAAW For Chrome是一个Aria2的Web前端，它使用了YAAW项目。      
		什么是YAAW:    
		又一个Aria2的Web前端(Yet Another Aria2 Web Frontend)，它是用纯HTML/CSS/Javascirpt实现的。    
		不需要任何HTTP服务器、后端支持，你只需要一个浏览器就可以使用。
		 
		[Chrome插件(百度网盘助手)](https://chrome.google.com/webstore/detail/baiduexporter/mjaenbjdjmgolhoafkohbhhbaiedbkno)
		可以方便的把百度网盘的下载地址导出到aria2/aria2-rpc，支持YAAW。    

----

###jsonrpc 密码验证

aria2 v1.18.4新增了 `--rpc-secret` ,设置的RPC授权令牌, 取代 `--rpc-user` 和 `--rpc-passwd` 选项，之后的版本都应该使用`--rpc-secret`:

在配置文件中修改`#rpc-secret=<TOKEN>`项，取消注释，`<TOKEN>`改为一个密码，即可实现密码访问限制，没有密码的人无法访问aria2c的RPC。
 
登录web UI，在web UI的配置中，修改`JSON-RPC PATH`为`http://token:secret@hostname:port/jsonrpc`。

举例：

	IP: 10.42.1.100
	
	aria2.conf中配置：
	rpc-secret=abc123
	
	则web UI(YAAW)的配置中的JSON-RPC PATH:
	http://token:abc123@10.42.1.100:6800/jsonrpc
	
	刷新，即可访问。

webui-aria2的web UI无法保存密码，也无`JSON-RPC PATH`配置，因此每次登录都需要配置密码。

----

参考:

* [Aria2 & YAAW 使用说明](http://aria2c.com/usage.html)
* [树莓派变身Aria2下载服务器](http://blog.csdn.net/sonsie007/article/details/18942943)
* [Mac配置aria2](http://sspai.com/32167)
* [YAAW-Yet Another Aria2 Web Frontend](http://binux.github.io/yaaw/)