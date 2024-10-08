define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	# ... 其他安装步骤 ...
	
	# 添加自动安装依赖的脚本
	$(INSTALL_DIR) $(1)/usr/lib/opkg/info
	$(INSTALL_DATA) ./files/$(PKG_NAME).control $(1)/usr/lib/opkg/info/
	$(INSTALL_DATA) ./files/$(PKG_NAME).postinst $(1)/usr/lib/opkg/info/
endef

# 创建 postinst 脚本
define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ "${IPKG_NO_SCRIPT}" = "1" ] && exit 0
. /lib/functions.sh

for pkg in $(opkg depends $(PKG_NAME) | cut -d: -f2); do
    opkg install $$pkg
done

exit 0
endef