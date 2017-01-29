Aria2
=====


* [https://aria2.github.io/]  
* [https://github.com/aria2/aria2] 

aria2 is a lightweight multi-protocol & multi-source command-line download utility. It supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink. aria2 can be manipulated via built-in JSON-RPC and XML-RPC interfaces.


aria2 是一款支持多种协议的轻量级命令行下载工具。有以下特性：

- 多线程连线：aria2 会自动从多个线程下载文件，并充分利用你的带宽；
- 轻量：运行时不会占用过多资源，根据官方介绍，内存占用通常在 4MB~9MB，使用 BitTorrent 协议，下行速度 2.8MB/s 时 CPU 占用率约 6%；
- 全功能 BitTorrent 客户端；
- 支持 RPC 界面远程控制

## Install
Arch Linux:

	sudo pacman -Syu aria2

Ubuntu:

	sudo apt-get install aria2
	
Mac:

	sudo brew install aria2
	
## Start

aria2提供两种方式使用，一种是直接命令行模式下载，不推荐使用这种方法，推荐使用另外一种RPC模式，这种方式aria启动之后只会安静的等待下载请求，下载完成后也只会安静的驻留后台不会自动退出。而使用RPC模式推荐做一个配置文件方便使用。把配置文件放在 ~/.aria2下。

* 直接使用
	* Download from WEB:
			
			$ aria2c http://example.org/mylinux.iso
	* BitTorrent: 
			
			$ aria2c http://example.org/mylinux.torrent
			$ aria2c 'magnet:?xt=urn:btih:XXXXXX'
	* Download URIs found in text file:

			$ aria2c -i uris.txt

* RPC模式
	
		$ aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all -c -D
		
	但是这种命令不好，配置不方便保存，并且使用`-D`（后台运行）就无法看到错误信息。
	
因此推荐启动方式是RPC模式并使用配置文件 `$HOME/.aria2/aria2.conf`
	
	cd ~
	mkdir .aria2
	cd .aria2
	touch aria2.conf
	touch aria2.session

aria2 的配置写在 `aria2.conf` 中，只需要更改下载目录 dir 与预分配方式 file-allocation，其他配置可以不更改。
	
	$ aria2c --conf-path="$HOME/.aria2/aria2.conf" -D

建议先不要添加`-D`选项，以查看是否运行正常。
	
由于默认的aria2是不带GUI的，所以需要一个WEB UI。    

可以选择使用web页面或自己搭建web:
	
* 访问下列web页面，选择菜单（设置-连接设置），配置主机`localhost`、端口号`6800`，即可连接对应的aria2服务器。
	
	* [https://ziahamza.github.io/webui-aria2/]    
	* [http://aria2c.com/]
	
* 搭建web:
		
	1. 安装Apache服务器
			
			$ sudo apt-get install apache2 
	2. Apache默认的http根目录是在/var/www目录下(Arch Linux为/srv/http)，下载web UI，拷贝到该目录后，直接访问localhost:80即可。

			git clone https://github.com/ziahamza/webui-aria2
			mv webui-aria2 /var/www		
	
* [Chrome插件(YAAW下载管理器)](https://chrome.google.com/webstore/detail/yaaw/hbjpfaalboebibgfmedmjijhbjapcnki)     

	YAAW For Chrome是一个Aria2的Web前端，它使用了YAAW项目。    
	  
	什么是YAAW：    
	又一个Aria2的Web前端(Yet Another Aria2 Web Frontend)，它是用纯HTML/CSS/Javascirpt实现的。    
	不需要任何HTTP服务器、后端支持，你只需要一个浏览器就可以使用。  
		 
* [Chrome插件(百度网盘助手)](https://chrome.google.com/webstore/detail/baiduexporter/mjaenbjdjmgolhoafkohbhhbaiedbkno)

	可以方便的把百度网盘的下载地址导出到aria2/aria2-rpc，支持YAAW。    


## jsonrpc 密码验证

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
* [aria2c manual](https://aria2.github.io/manual/en/html/aria2c.html)
* [树莓派变身Aria2下载服务器](http://blog.csdn.net/sonsie007/article/details/18942943)
* [Mac配置aria2](http://sspai.com/32167)
* [YAAW-Yet Another Aria2 Web Frontend](http://binux.github.io/yaaw/)