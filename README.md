# sdk-action

![操作截图](./action.jpg)

fork 后会自动切到自己的仓库：
   1. 切到Action页面
   2. 选择”编译 OpenWrt 插件“工作流
   3. 点击run workflow按钮   . 填写信息
   4. 点击Run workflow

接下来会自动执行编译，编译时间快的可能2，3分钟，取决于插件本身的编译时间

编译完成后，点击对应工作，可查看编译好的插件压缩包，压缩包中包含了你需要编译的插件以及所有依赖软件包

下载解压后找到需要的ipk文件

将ipk文件传到路由器后台，使用 opkg 命令安装.
# 1.自动版本，当前主分支 [获取设备平台](https://firmware-selector.openwrt.org/) 
   在官网输入设备名称后，会显示平台,如：ramips/mt7621。复制到Action中

# 2.手动填写源码版本，[切换到源码分支](../../tree/sourcecode)
   在源码分支中，获取 OpenWrt 官方源码（[点击这里](https://firmware-selector.openwrt.org/)）,然后填写地址

![操作截图](./firmware-selector.openwrt.org.jpeg)

下拉到最下面选择SDK
![操作截图](./infra.openwrt.org.jpeg)

## 可选的包

<table width="100%">
   <thead>
      <tr>
         <th>仓库</th>
         <th>名称</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>https://github.com/openwrt-packages/openwrt-vlmcsd</td>
         <td>openwrt-vlmcsd</td>
      </tr>
      <tr>
         <td>https://github.com/openwrt-packages/luci-app-vlmcsd</td>
         <td>luci-app-vlmcsd</td>
      </tr>
      <tr>
         <td>https://github.com/openwrt-packages/helloworld</td>
         <td>luci-app-ssr-plus</td>
      </tr>
      <tr>
         <td>https://github.com/openwrt-packages/luci-app-bandwidthd</td>
         <td>luci-app-bandwidthd</td>
      </tr>
      <tr>
         <td>https://github.com/openwrt-packages/luci-app-clash</td>
         <td>luci-app-clash</td>
      </tr>
   </tbody>
</table>

## 安装说明

1. 将编译好的 .ipk 文件上传到您的 OpenWrt 设备的 Web 界面（LuCI）。

2. 在 Web 界面中，导航到 "系统" -> "软件包"，然后上传并安装您的插件 IPK 文件。

3. 系统会自动处理依赖关系：
   - LuCI 会尝试自动安装所需的依赖包。
   - 如果所有依赖都能成功安装，插件将直接安装完成。

4. 如果安装失败：
   - 检查错误消息，它可能会列出无法满足的依赖。
   - 确保您的 OpenWrt 系统已更新到最新版本，并且软件源配置正确。
   - 如果 Web 界面无法解决依赖问题，您可能需要通过 SSH 连接到设备，并使用 opkg 命令行工具手动安装依赖：

     ```bash
     opkg update
     opkg install <missing-dependency-1> <missing-dependency-2> ...
     opkg install /tmp/your-plugin.ipk
     ```

注意：
- 某些依赖可能需要额外的软件源。请参考插件的文档以获取更多信息。
- 如果插件安装后无法正常工作，请检查系统日志以获取更多信息。