#!bin/bash
for image in `cat ./images_list.txt`
do
  echo "begin download $image"
  tmp_image=${image#*\/}
  upload_image=192.168.174.130/gcr.io/${tmp_image}
  echo ${tmp_image}
  echo ${upload_image}
  image_version=${tmp_image//[\:\/]/-}
  echo ${image_version}
  git checkout .
  git pull --force
  echo "From ${image}" > Dockerfile
  echo ">>>>>>>>>>>>>>>>>Dockerfile 已经变为 :" cat Dockerfile
  echo -e ">>>>>>>>>>>>>>>>>开始提交代码，下载镜像为: "${image}"\n"
  git add .
  git commit -m "add images '${image}'"
  git tag release-v${image_version}
  git push --tags
  echo -e ">>>>>>>>>>>>>>>>>提交代码成功!\n"
  echo "等待120S"
  sleep 2m
  echo "开始下载镜像到本地"
  docker pull registry.cn-hangzhou.aliyuncs.com/kp_gcr_io/image:${image_version}
  echo "上传镜像到本地私库"
  docker tag registry.cn-hangzhou.aliyuncs.com/kp_gcr_io/image:${image_version} ${upload_image}
  docker rmi registry.cn-hangzhou.aliyuncs.com/kp_gcr_io/image:${upload_image}
done
