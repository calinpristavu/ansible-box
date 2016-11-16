server {

        set $default_controller "app_dev.php";

        server_name {{ nginx.server_name }};
        root {{ nginx.doc_root }};
        index $default_controller;

        # Gzip
        gzip on;
        gzip_min_length 1000;
        gzip_types text/plain text/css application/x-javascript text/xml application/xml application/xml+rss text/javascript;
        gzip_disable "MSIE [1-6]\.";

        location / {
        # try to serve file directly, fallback to app.php
        try_files $uri /$default_controller$is_args$args;
        }

        location ~ ^/(app|app_dev)\.php(/|$) {
                include fastcgi_params;
                fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                fastcgi_param HTTPS off;
                fastcgi_buffer_size 16k;
                fastcgi_buffers 4 16k;
                fastcgi_param APP_ENV dev;
                fastcgi_param APP_DEBUG 1;
                fastcgi_param APP_ON_NFS true; # only dev machines
        }

        sendfile off;

        error_log /var/log/nginx/{{ nginx.server_name }}.error.log;
        access_log /var/log/nginx/{{ nginx.server_name }}.access.log;

        add_header X-Frame-Options SAMEORIGIN;
}