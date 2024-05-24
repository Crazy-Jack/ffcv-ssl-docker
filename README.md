

We break down the docker image building by several subcopmonents. 


1. Build everything else except opencv
`docker build -t ffcv-ssl-dense-pred-before-opencv.v.0.1 -f Dockerfile.before.opencv . > build.log.before.opencv.v0.1 2>&1`

2. Build open cv 
`DOCKER_BUILDKIT=0 docker build -t ffcv-ssl-dense-pred-opencv.v.0.1 --pull=false -f Dockerfile.opencv . > build.log.opencv.v0.1 2>&1`
