yum -y --setopt tsflags=nodocs --setopt install_weak_deps=0 --enablerepo=powertools install automake autoconf libtool flex bison \
    openssl-devel libxml2-devel libaio-devel readline-devel glib2-devel userspace-rcu-devel \
    libacl-devel fuse-devel redhat-rpm-config rpcgen libtirpc-devel make python3-devel rsync libuuid-devel \
    rpm-build git attr libcurl-devel selinux-policy-devel firewalld liburing-devel epel-release && yum install -y gperftools-devel
    
yum -y update --setopt tsflags=nodocs --setopt install_weak_deps=0 && yum clean all && rm -rf /var/cache/yum

yum install -y dbench nfs-utils attr yajl

git clone --depth 1 https://github.com/gluster/glusterfs.git

cd glusterfs

./autogen.sh

./configure --disable-linux-io_uring --without-libtirpc

make

make install

systemctl daemon-reload

systemctl start glusterd
