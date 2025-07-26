## Етапи виконання
### 1. Деплой Jenkins
Jenkins запущено у Docker:
```
docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts
 ```

Встановлені плагіни:
- Git Plugin
- Maven Integration
- Publish Over SSH

### 2. EC2 Сервер
Запущено інстанс EC2 (Ubuntu).
Встановлено Java:

```
sudo apt install openjdk-17-jre-headless
```

Налаштовано SSH-доступ із Jenkins (через Publish Over SSH).

### 3. Jenkins Freestyle Job

Назва: Simple Freestyle Job
Source: GitHub → форкнутий репозиторій
Build step:
mvn clean install --file complete/pom.xml
Post-build action:
Передача .jar на EC2 (target/*.jar)
Команда запуску:
```
#!/bin/bash
pkill -f 'java -jar .*\.jar' || true
sleep 2
JAR_FILE=$(find /home/ubuntu/app -maxdepth 1 -name "*.jar" | head -n 1)
nohup java -jar "$JAR_FILE" > /home/ubuntu/app/app.log 2>&1 &

```
- дана команда була додана в файл start.sh та налаштована на пошук файлу для викоання. Проблеми також виникли з тим щоб у правильне місце підставлявся файл jar, постійно шлях задвоювався так і не вирішив, але проект запустився. 
### 4. Автоматизація
Встановлено періодичний запуск через Build periodically (Cron):
H/5 * * * *

## result 

[build console log](#29.txt)<br>
![скріншот з виводом](1.jpg)