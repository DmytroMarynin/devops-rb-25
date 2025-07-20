## Завдання 1: Створення StatefulSet для Redis-кластера

### Створили Redis-кластер на основі StatefulSet із двома репліками, кожна з яких має:

- стабільне ім’я (redis-0, redis-1)
- власний том даних (PVC)
- спільну мережу через ClusterIP service

#### Виконані кроки:

- Створено [redis-pvc.yaml](selfhosted-k8s/redis-pvc.yaml) з шаблоном volumeClaimTemplates.
- Створено [redis-statefulset.yaml](selfhosted-k8s/redis-statefulset.yaml) на базі офіційного образу redis.
- Додано [redis-service.yaml](selfhosted-k8s/redis-service.yaml) для доступу між подами.

Використано:
kubectl apply -f redis-service.yaml
kubectl apply -f redis-statefulset.yaml

Перевірено:
kubectl get pods
Отримано:
redis-0   Running
redis-1   Running

Перевірено сталість імен і PVC:
kubectl get pvc
PVC створені для кожної репліки (redis-data-redis-0, redis-data-redis-1).

## Завдання 2: Falco через DaemonSet

Мета:
Розгорнути Falco через Helm як DaemonSet для моніторингу безпеки.

#### Виконані кроки:

Створено namespace:
kubectl create namespace falco

Додано репозиторій:
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update

Спроба розгортання:
helm install falco falcosecurity/falco -n falco \
  --set driver.kind=ebpf \
  --set falcosidekick.enabled=false

#### Проблеми:

Falco не запустився на macOS через:
Обмеження eBPF та ядра Linux
Підвіс у статусі Init:0/2
Немає логів, pod не перейшов у Running

Рішення:
Falco на macOS не підтримується — завдання пропущено через технічні обмеження платформи.

#### Висновок

✅ Успішно реалізовано кластер Redis через StatefulSet.
❌ Falco не вдалося запустити через обмеження eBPF у macOS. 
🔄 Можливе повернення до Falco в майбутньому на Linux VM або в кластері в хмарі.