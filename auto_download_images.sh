docker login --username=583939733@qq.com registry.cn-hangzhou.aliyuncs.com
for image in `cat ./images_list.txt`
do
  echo "begin download $image"
  image=${1}
  tmp_image=${image#*\/}
  echo tmp_image
  image_version=${tmp_image//[\/:]/-}
  echo image
#  git checkout .
#  git pull
#  echo "From ${image}" > Dockerfile
#  echo ">>>>>>>>>>>>>>>>>Dockerfile 已经变为 :" cat Dockerfile
#  echo -e ">>>>>>>>>>>>>>>>>开始提交代码，下载镜像为: "${image}"\n"
#  git add .
#  git commit -m "add images '${image}'"
#  git tag release-v${gen_image}
#  git push --tags
#  echo -e ">>>>>>>>>>>>>>>>>提交代码成功!\n"
#  echo "等待120S"
#  sleep 2m
#  echo "开始下载镜像到本地"
#  docker login --username=583939733@qq.com registry.cn-hangzhou.aliyuncs.com
#  docker docker pull registry.cn-hangzhou.aliyuncs.com/kp_gcr_io/image:${image_version}
#  echo "上传镜像到本地私库"
#  docker tag registry.cn-hangzhou.aliyuncs.com/soolaugust/image:${image_version} ${image}
#  docker rmi registry.cn-hangzhou.aliyuncs.com/soolaugust/image:${gen_image}
done