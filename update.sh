#!/usr/bin/env sh

######################################################################
# @author      : yetist (yetist@gmail.com)
# @file        : update.sh
# @created     : 星期五 4月 25, 2025 16:27:33 CST
#
# @description : 从软件仓库下载 deb 包
######################################################################

sources=(
  "https://pkg.loongnix.cn/loongnix/pool/main/g/gtk+3.0/libgtk-3-0_3.24.5-1.lnd.1_loongarch64.deb"
  "https://pkg.loongnix.cn/loongnix/pool/main/j/jbigkit/libjbig0_2.1-3.2_loongarch64.deb"
  "https://pkg.loongnix.cn/loongnix/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.2-2.lnd.4_loongarch64.deb"
  "https://pkg.loongnix.cn/loongnix/pool/main/libw/libwebp/libwebp6_0.6.1-2.lnd.2_loongarch64.deb"
  "https://pkg.loongnix.cn/loongnix/pool/main/p/pango1.0/libpango-1.0-0_1.42.4-8~deb10u1.lnd.1_loongarch64.deb"
  "https://pkg.loongnix.cn/loongnix/pool/main/p/pango1.0/libpangocairo-1.0-0_1.42.4-8~deb10u1.lnd.1_loongarch64.deb"
  "https://pkg.loongnix.cn/loongnix/pool/main/p/pango1.0/libpangoft2-1.0-0_1.42.4-8~deb10u1.lnd.1_loongarch64.deb"
  "https://pkg.loongnix.cn/loongnix/pool/main/t/tiff/libtiff5_4.1.0+git191117-2~deb10u1.lnd.4_loongarch64.deb"
)

for i in ${sources[@]};
do
  filename=$(basename $i)
  dirname=$(echo $filename|awk -F_ '{print $1}')
  [ -d $dirname ] || mkdir $dirname
  if [ ! -f $dirname/$filename ]; then
    wget -O $dirname/$filename $i
  fi
done
