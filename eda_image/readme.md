# steps:

Construir la imagen de nuestro contenedor (con arquitectura amd)
```
podman build --arch amd64 . -t quay.io/lvazquez_r3dh4t/ansible_eda/eda-image-check-disk:1
```

Tag para la imagen
```
podman tag localhost/eda-image-check-disk:latest quay.io/ansible_eda/eda-image-check-disk:1
```

Push para el repo (quay.io/lvazquez_r3dh4t/ansible_eda/eda-image-check-disk). 
Ref: https://quay.io/repository/lvazquez_r3dh4t/ansible_eda/eda-image-check-disk
```
podman push quay.io/lvazquez_r3dh4t/ansible_eda/eda-image-check-disk:1
```