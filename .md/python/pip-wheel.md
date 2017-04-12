# Python 打包第三方库

pip 的子命令 [wheel](http://wheel.readthedocs.org/en/latest/)
可以用于打包第三方库到 whl 文件,
whl 一般用于本地安装.


例子:

    pip wheel tornado
    pip wheel 'ipython[all]'


默认保存在当前目录的 wheelhouse 文件夹下, 接下来就可以离线安装了:

    pip install --find-links=wheelhouse ipython

    
对了, pip 默认没有带 wheel, 最开始还需要自己安装:

    pip install wheel