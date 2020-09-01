#!bin/bash
for image in `cat ./images_pull_list.txt`
do
  echo "begin download $image"
  tmp_image=${image#*\/}
  upload_image=192.168.174.130/gcr.io/${tmp_image}
  echo ${tmp_image}
  echo ${upload_image}
  image_version=${tmp_image//[\:\/]/-}
  echo ${image_version}
  echo "开始下载镜像到本地"
  docker pull registry.cn-hangzhou.aliyuncs.com/kp_gcr_io/image:${image_version}
  echo "上传镜像到本地私库"
  docker tag registry.cn-hangzhou.aliyuncs.com/kp_gcr_io/image:${image_version} ${upload_image}
  docker rmi registry.cn-hangzhou.aliyuncs.com/kp_gcr_io/image:${image_version}
  docker push ${upload_image}
done
