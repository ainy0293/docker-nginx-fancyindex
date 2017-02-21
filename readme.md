# docker-nginx-fancyindex

***

### Synopsis

The Fancy Index module makes possible the generation of file listings, like the built-in autoindex module does, but adding a touch of style. This is possible because the module allows a certain degree of customization of the generated content:

Custom headers (either local or stored remotely).
Custom footers (either local or stored remotely).
Add you own CSS style rules.
Allow choosing to sort elements by name (default), modification time, or size; both ascending (default), or descending (new in 0.3.3).
This module is designed to work with NGINX, a high performance open source web server written by Igor Sysoev.

> [https://github.com/aperezdc/ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex)

***
This is a nginx web, Use it as a file server, if use nginx autoindex, if the use of nginx comes with autoindex,  the user interface is  not beautiful,

But fancyindex uses our user interface more beautiful.

### make images:

clone this repository, use command

	git clonehttps://github.com/ainy0293/docker-nginx-fancyindex.git
	cd docker-nginx-fancyindex
	docker build -t nginx-fancyindex .

### See image, use command

	docker images

### Run container from the image

	docker run -d -p 80 --name nginx-fancyindex -h nginx-fancyindex -v /var/www/html:/usr/local/nginx nginx-fancyindex

***

### Example screenshot

![ ](http://ocwljlzzv.bkt.clouddn.com/image/fancyindex.png)