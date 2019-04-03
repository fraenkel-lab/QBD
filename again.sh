docker stop qbd; docker rm qbd; docker build --rm=false -t qbd:latest . && docker run --name qbd -v `pwd`/data:/data -td qbd
