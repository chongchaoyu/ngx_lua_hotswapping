# sudo yum install -y yum-utils
# sudo yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo
# sudo yum install -y openresty

sudo cp -fv confs/*.conf /usr/local/openresty/nginx/conf/conf.d/
sudo cp -rv hotswapping /usr/local/openresty/lualib/

sudo systemctl restart openresty
