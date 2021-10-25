# Django-REST-Framework-And-React-Todo-APP
1) make some changes
2) push to repo

# Build and push image to docker hub
docker build -t sharypovandrey/drf-react-todo .
docker push sharypovandrey/drf-react-todo

# Launch new app on kubernetes
1) Set KUBECONFIG=path to kubernetes config yaml file
2) helm install APP_NAME /hdd/Github/vscoder/app/helm/k8s-project --set project=APP_NAME --set password=qwerty --set image.tag=latest --set image.repository=sharypovandrey/drf-react-todo
/hdd/Github/vscoder/app/helm/k8s-project - this path can be different

# tips
Superuser
admin
qwerty
