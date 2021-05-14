#!/usr/bin/bash


#ansible node4 -m file -a "path="/dvd"  state="directory" owner="root" mode="u+rwx"" -b

ansible node4 -m mount -a "path="/dvd" src="/dev/cdrom" fstype="iso9660" state="mounted"" -b

ansible node4 -m yum_repository -a "name="AppStream" description="Appstream_repository" baseurl="file:///dvd/AppStream" gpgcheck="True" gpgkey="file:///dvd/RPM-GPG-KEY-redhat-release"" -b


ansible node4 -m yum_repository -a "name="BaseOs" description="Baseos_repository" baseurl=file:///dvd/BaseOS gpgcheck=True gpgkey=file:///dvd/RPM-GPG-KEY-redhat-release" -b

ansible node4 -m shell -a "yum makecache"

ansible node4 -m shell -a "yum repolist"

