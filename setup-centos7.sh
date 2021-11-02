rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum -y --setopt tsflags=nodocs --enablerepo=extras install epel-release-7 autoconf automake bison cmockery2-devel \
    dos2unix flex selinux-policy-devel rsync libcurl-devel fuse-devel glib2-devel libacl-devel libaio-devel libattr-devel \
    libtool libxml2-devel make openssl-devel pkgconfig python-devel rpm-build readline-devel \
    userspace-rcu-devel git userspace-rcu redhat-rpm-config rpcgen make libuuid-devel deltarpm firewalld gperftools-devel

yum -y update --setopt tsflags=nodocs && yum clean all && rm -rf /var/cache/yum

yum install -y dbench nfs-utils attr yajl

git clone --depth 1 https://github.com/gluster/glusterfs.git

cd glusterfs

./autogen.sh

./configure --disable-linux-io_uring --without-libtirpc

make

make install

systemctl daemon-reload

systemctl start glusterd
