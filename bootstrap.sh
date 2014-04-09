sudo yum update -y

sudo cp /vagrant/resolv.conf /etc/resolv.conf

# Firewall
sudo service iptables stop
sudo chkconfig iptables off

# Apache
sudo yum install -y httpd
sudo yum install -y httpd-devel # for mod_wsgi

# yum packages
wget https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh epel-release-6-8.noarch.rpm
sudo rpm -Uvh remi-release-6.rpm
sudo cp /vagrant/epel.repo /etc/yum.repos.d/epel.repo

# MySQL
sudo cp /vagrant/my.cnf /etc/my.cnf
sudo service mysqld start

# Git
sudo yum install -y git
git config --global user.name "user"
git config --global user.email my_address@example.com

# python
wget --no-check-certificate http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz #--no-check-certificateは openssl関連の変更のために2014/4/10に追加しました。
tar xvzf Python-2.7.5.tgz
cd Python-2.7.5
sudo ./configure --with-threads --enable-shared --prefix=/usr/local
sudo make
sudo make altinstall
echo '/usr/local/lib' > /etc/ld.so.conf.d/python2.7.conf
ldconfig
cd $HOME

# mod_wsgi
wget http://modwsgi.googlecode.com/files/mod_wsgi-3.4.tar.gz
tar vzxf mod_wsgi-3.4.tar.gz
cd mod_wsgi-3.4
sudo ./configure --with-python=/usr/local/bin/python2.7
sudo make
sudo make install
cd $HOME
sudo echo 'LoadModule wsgi_module modules/mod_wsgi.so' >> /etc/httpd/conf/httpd.conf

# vagrantユーザで/var/www/htmlを編集できるためにchownをする
sudo chown -R vagrant:vagrant /var/www/

# dev.djangoenv.com.conf関連の準備
sudo cp /vagrant/dev.djangoenv.com.conf /etc/httpd/conf.d/dev.djangoenv.com.conf
mkdir /var/www/dev.djangoenv.com
sudo mkdir /var/log/httpd/dev.djangoenv.com

# apacheの再起動
sudo service httpd start
sudo chkconfig httpd on
