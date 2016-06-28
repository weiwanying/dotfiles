#!/usr/bin/perl
# write by huabo, 2009-11-20
# 将svn/conf/passwd的明文密码转换为httpd server所需的密码
use warnings;
use strict;

#open the svn passwd file
open (FILE, "passwd") or die ("Cannot open the passwd file!!!\n");

#clear the apache passwd file
open (OUT_FILE, ">webpasswd") or die ("Cannot open the webpasswd file!!!\n");
close (OUT_FILE);

#begin
foreach (<FILE>) {
    if($_ =~ m/^[^#].*=/) {
        $_ =~ s/=//;
        `htpasswd -b webpasswd $_`;
    }
}
