#!bin/bash
for image in `cat ./images_use_list.txt`
do
  echo "begin download $image"
  tmp_image=${image#*\/}
  upload_image=harbor.chargerhere.net/gcr.io/${tmp_image}
  echo ${tmp_image}
  echo ${upload_image}
  image_version=${tmp_image//[\:\/]/-}
  echo ${image_version}
  echo "开始下载镜像到本地"
  docker pull ${upload_image}
  echo "上传镜像到本地私库"
  docker tag ${upload_image} ${image}
done
