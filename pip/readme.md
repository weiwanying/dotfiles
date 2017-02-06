pip
====

## PyPI Mirror

* [PyPI Mirror Status](https://www.pypi-mirrors.org/)
* https://pypi.mirrors.ustc.edu.cn/
* https://pypi.douban.com/
* https://pypi.tuna.tsinghua.edu.cn/

## Using a mirror

Single Usage:

    pip install -i https://<mirror>/simple <package>

Global settings:
Add `~/.pip/pip.conf` that includes:

    [global]
    index-url = https://<mirror>/simple
