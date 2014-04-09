Djangoを使用した開発環境
=====================

Djangoを使用したプロジェクトのテスト環境を作成するため、環境構築を行いました。Vagrantの練習も兼ねています

## 動作環境
* Mac os x (10.9.2)
* iTerm2
* VirtualBox (4.3.6)
* Vagrant (1.4.3)
* django1.6.2

## 初期設定
Vagrantを使います。  
基本的なことは[ドットインストールで](http://dotinstall.com/lessons/basic_local_development_v2)

VagrantBoxの追加  

    vagrant box add centos64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box

Vagrantのプラグインをインストール  

    vagrant plugin install vagrant-omnibus
    vagrant plugin install vagrant-berkshelf

## 使い方
ターミナルで  

    cd ~
    git git@github.com:ryotarogoto/Django_env.git
    cd Django_env
    vagrant up

待ちます...

仮想環境に接続して環境設定を続ける。

    vagrant ssh
    sudo visudo

編集画面が立ち上がるので  
secure_pathに/usr/local/bin  
を追加する。

Pythonの様々なツールとDjangoを追加

    wget http://peak.telecommunity.com/dist/ez_setup.py
    sudo python2.7 ez_setup.py
    sudo easy_install pip
    sudo pip install django
    sudo pip install mysql-python
    cd /var/www/dev.djangoenv.com/

プロジェクトの作成  
    sudo django-admin.py startproject mysite

これで192.168.33.50にアクセスすると画面が確認出来る。  
ここから先は[Djangoのチュートリアル](https://docs.djangoproject.com/en/1.6/intro/tutorial01/)

## 動作確認
2014/04/10
