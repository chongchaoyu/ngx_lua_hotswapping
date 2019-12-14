# Introduction
Do you have to reload nginx when you modify the lua scripts in production? Especially your nginx holds persistent connections, such as webscoket proxy. Use this you can hotswap the lua scripts easily, it is 100% MIT licensed.

# Dependencies
openresty or nginx with lua-nginx-module

# Install
Install openresty or lua-nginx-module for nginx firsty, then copy the hotswapping scripts and hotswapping.conf file into the openresty folders.

[test@localhost ~]$ sudo yum install -y yum-utils

[test@localhost ~]$ sudo yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo

[test@localhost ~]$ sudo yum install -y openresty

[test@localhost ~]$ sudo cp -fv hotswapping.conf /usr/local/openresty/nginx/conf/

[test@localhost ~]$ sudo cp -rv hotswapping /usr/local/openresty/lualib/

[test@localhost ~]$ sudo systemctl restart openresty

# Usage
ngx_lua_hotswapping implements hotswapping by version comparation(equal or not).

You MUST put Lua scripts into seperate lua files, and use autoUpdate.require('xxx') to load lua files.

Like this:

    local au = require("hotswapping/autoUpdate").update()
    
    local ex = au.require("hotswapping/exsample")

After modifying lua files, you can send a http request the openresy to load the new lua files,

such as 'curl "http://127.0.0.1:5675/admin?name=hotswapping/exsample&version=1.0.1"', or use admin.sh,

auch as 'sh admin.sh sv au 1.0.1', if you do not assign a version, the version will be assigned automatically by admin.sh.

No lua script has a version at first, so no version number is equal to it.

# Custom
1.You can change the location and access rules for version admin in hotswapping.conf. 

2.You can change admin.sh to support more lua scripts, to assign a more reasonable version number.

# Test
Tested with openresty-1.15.8.2-6.el7.x86_64 under CentOS 7.4.
