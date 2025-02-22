upstream blokmap {
	server localhost:3000;
}

server {
	server_name blokmap.be;

	listen 80;
	listen [::]:80;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;
}

server {
	server_name blokmap.be;

	listen 443 ssl http2;
	listen [::]:443 ssl http2;

	ssl_certificate     /etc/letsencrypt/live/blokmap.be/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/blokmap.be/privkey.pem;
	include snippets/ssl_options.conf;

	location / {
		proxy_http_version 1.1;

		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;

		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection $connection_upgrade;

		proxy_pass http://blokmap;
	}
}
