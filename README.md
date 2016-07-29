# Docker image for [KanBoard](https://kanboard.net/) project management software

Verified to work with KanBoard v1.0.31

### Usage
Build the image:
```bash
docker build -t you/imagename .
```
Start the image:
```bash
docker run -v /data:/data -p 80:80 you/imagename
```
Browse to http://dockerip/ and login with admin/admin.

### Volume structure

* `htdocs`: Webroot
* `logs`: Nginx/PHP error logs
