#tmux

源码安装tmux

openssl -> libevent -> tmux

### openssl

    $ wget http://www.openssl.org/source/openssl-1.0.1f.tar.gz
    $ tar zxvf openssl-1.0.1f
    $ cd openssl-1.0.1f
    $ ./config shared --prefix=/usr/local --openssldir=/usr/local/ssl/ 
    $ make 
    $ make install

参数 ： shared 是生成动态连接库， –prefix 为安装目录，openssldir 是配置文件目录。

### libevent

    ./configure --prefix=/home/xxx/local/ CFLAGS="-I/home/local/include/" LDFLAGS="-L/home/local/lib/"

### tmux

    ./configure --prefix=/home/xxx/local/ 

### 共享库error
tmux: error while loading shared libraries: libevent-1.4.so.2: cannot open shared object file: No such file or directory

查询共享库位置: `$ ldconfig -p | grep mysql`

安装共享库后要注意共享库路径设置问题, 如下:
1. 如果共享库文件安装到了/lib或/usr/lib目录下, 那么需执行一下ldconfig命令
2. 如果共享库文件安装到了/usr/local/lib(很多开源的共享库都会安装到该目录下)或其它"非/lib或/usr/lib"目录下, 那么在执行ldconfig命令前, 还要把新共享库目录加入到共享库配置文件/etc/ld.so.conf中, 如下:

        # cat /etc/ld.so.conf
        include ld.so.conf.d/*.conf
        # echo "/usr/local/lib" >> /etc/ld.so.conf
        # ldconfig
3. 如果共享库文件安装到了其它"非/lib或/usr/lib" 目录下,  但是又不想在/etc/ld.so.conf中加路径(或者是没有权限加路径). 那可以export一个全局变量LD_LIBRARY_PATH, 然后运行程序的时候就会去这个目录中找共享库.

        export LD_LIBRARY_PATH=/usr/local/lib:$LD_LBRARY_PATH

