#!/bin/bash

# 获取插件名称和版本
NAME=$(grep -oP '(?<=NAME:=).*' Makefile)
PKG_NAME=$(grep -oP '(?<=PKG_NAME:=).*' Makefile)

echo "插件名称: $NAME"
echo "插件包名称: $PKG_NAME"

if [[ "$PKG_NAME" == *'$(NAME)'* ]]; then
  PLUGIN_NAME=$(echo "$PKG_NAME" | sed 's/\$\(NAME\)/'$NAME'/g')
else
  PLUGIN_NAME="$PKG_NAME"
fi

PLUGIN_VERSION=$(grep -oP '(?<=PKG_VERSION:=).*' Makefile)

# 将变量添加到 GitHub Actions 环境变量
echo "NAME=$NAME" >> $GITHUB_ENV
echo "PKG_NAME=$PKG_NAME" >> $GITHUB_ENV
echo "PLUGIN_NAME=$PLUGIN_NAME" >> $GITHUB_ENV
echo "PLUGIN_VERSION=$PLUGIN_VERSION" >> $GITHUB_ENV

echo "插件合并名称: $PLUGIN_NAME"
echo "插件版本: $PLUGIN_VERSION"
