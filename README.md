# 概要
ec-cube3開発用のvagrantです

# 環境
+ Windows7
+ VirtualBox 4.3.26
+ Vagrant 1.7.2

# セットアップ

## vagrant起動
```
$ git clone https://github.com/chihiro-adachi/eccube3-vagrant.git
$ cd eccube3-vagrant
$ vagrant up
$ vagrant ssh
```

## ec-cubeインストール
```
$ cd /vagrant
$ git clone -b eccube-3.0.0-beta https://github.com/EC-CUBE/ec-cube.git
$ cd ec-cube
$ ./eccube_install.sh pgsql
```
