# Tyatyushkin_microservices
Tyatyushkin microservices repository

---

### Docker-2

#### Выполненные работы

1. Создаем репозиторий **docker-2**
2. Устанавливаем **docker** и **docker-tools**
3. Изучаем базовые команды
4. Создаем новый проект **docker**
5. Создаем там *docker-host* с помощью **docker-machine**
6. Работаем с **docker-hub**

#### Задания со ⭐

1. Создаем 3 каталога: *ansible*, *packer*, *terraform*
2. Создаем playbook	 для раскатки docker в папке ansible: **install_docker.yml**
3. Создаем в каталоге packer **docker.json** где провиженором указываем ранее созданный playbook
4. Делаем build образа из **docker.json**
5. Создаем инфрастуктуру с помошью terraform с помощью нашего убраза, добавив счетчик:
```
resource "google_compute_instance" "docker" {
  count        = var.insta_count
  name         = "docker-base-${count.index}"
  ......
```
6. Создаем инфраструктуру
7. Далее настраваем ansible для работы с динамическим инвентори создав файлы **ansible.cgf** и **inventory.gcp.yml**
8. Создаем playbook для расскатки нашего docker образа: **reddit_image.yml**
9. Раскатываем playbook и проверяем результаты.

---

