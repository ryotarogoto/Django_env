Djangoを使用した開発環境
=====================

Djangoを使用したプロジェクトのテスト環境を作成するため、環境構築を行いました。

## 動作環境
* Mac os x (10.9.2)
* iTerm2
* VirtualBox (4.3.6)
* Vagrant (1.4.3)

## 初期設定
Vagrantを使います。基本的なことは[こちら](http://dotinstall.com/lessons/basic_local_development_v2)

VagrantBoxの追加  

    vagrant box add centos64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box

Vagrantのプラグインをインストール  

    vagrant plugin install vagrant-omnibus
    vagrant plugin install vagrant-berkshelf

## 使い方
ターミナルで  

    cd ~
    mkdir Django_env
    cd Django_env
    git 

