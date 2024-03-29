server {
	listen 80 default_server;

	root /home/lukas/Projects/SYNC/NodeJS/ldek/LekNaNuxt/dist;

	# Add index.php to the list if you are using PHP
	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location = /favicon.ico { access_log off; log_not_found off; }
	location /static/ {
	    access_log off;
	    log_not_found off;
	    root /home/lukas/Projects/Python/LekNaServer;
	}

	location /media/ {
	    root /home/lukas/Projects/Python/LekNaServer;
	}

	location /protected/ {
	    internal;
	    root   /home/lukas/webapps/django-sendfile/ldek/;
	}

	location / {
	    try_files $uri $uri/ /index.html;
	}

	location ^~ /graphql {
	    include proxy_params;
	    proxy_pass http://127.0.0.1:8000;
	}

	location ^~ /presentation/get-slide {
	    include proxy_params;
	    proxy_pass http://127.0.0.1:8000;
	}

	location ^~ /ws {
	    proxy_pass http://127.0.0.1:8000;

	    proxy_http_version 1.1;
	    proxy_set_header Upgrade $http_upgrade;
	    proxy_set_header Connection "upgrade";

	    proxy_redirect off;
	    proxy_set_header Host $host;
	    proxy_set_header X-Real-IP $remote_addr;
	    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	    proxy_set_header X-Forwarded-Host $server_name;
	}


	# pass PHP scripts to FastCGI server
	#
	#location ~ \.php$ {
	#	include snippets/fastcgi-php.conf;
	#
	#	# With php-fpm (or other unix sockets):
	#	fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
	#	# With php-cgi (or other tcp sockets):
	#	fastcgi_pass 127.0.0.1:9000;
	#}

	# deny access to .htaccess files, if Apache's document root
	# concurs with nginx's one
	#
	#location ~ /\.ht {
	#	deny all;
	#}
}


# Virtual Host configuration for example.com
#
# You can move that to a different file under sites-available/ and symlink that
# to sites-enabled/ to enable it.
#
#server {
#	listen 80;
#	listen [::]:80;
#
#	server_name example.com;
#
#	root /var/www/example.com;
#	index index.html;
#
#	location / {
#		try_files $uri $uri/ =404;
#	}
#}
