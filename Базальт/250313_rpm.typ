Алексеева Мария, младший программист в Базальте

apt в альтушке (Маше) --- это высокоуровневая обвязка над rpm

- `apt-get dist-upgrade` обновляет систему (не затрагивая ядро)
- `apt-get clean` очищает кеш
- `apt-cache search` ищет по названию пакета
- `apt-cache showpkg` 

rpm --- это семейство пакетных менеджеров, применяемых в различных дистрибутивах линукса. Они отличаются набором макросов и пр.

Утилита `rpm` выполняет роль низкоуровневого пакетного менеджера, поверх которого работает `apt`.

- `rpm -qip` выводит информацию о файле-пакете
- `rpm -qi` выводит информацию об установленном пакете
- `rpm -Uvh` 

Из чего состоит rpm пакет? Все они бывают двух видов --- srpm (предоставляет исходный код) и rpm (предоставляет бинари).

`rpmdev-setuptree` создаёт окружение создателя rpm пакета

- BUILD --- каталог, внутри которого лежат файлы сборки 
- RPMS --- собранные RPM пакеты под разные архитектуры
 - x86_64
 - noarch
- SRPMS

Основа сборки --- spec-файл.

== spec файл
```spec
%add_python3_req_skip gpresult.Preferences.Preferences.Drive
%add_python3_req_skip gpresult.Preferences.Preferences.EnvVar
%add_python3_req_skip gpresult.Preferences.Preferences.File
%add_python3_req_skip gpresult.Preferences.Preferences.Folder
%add_python3_req_skip gpresult.Preferences.Preferences.Inifile
%add_python3_req_skip gpresult.Preferences.Preferences.Networkshare
%add_python3_req_skip gpresult.Preferences.Preferences.Shortcut

Name: gpresult
Version: 0.0.4
Release: alt1

Summary: Display applied policies
License: GPLv3+
Group: Other
Url: https://gitlab.basealt.space/alt/gpresult
BuildArch: noarch

BuildRequires: rpm-build-python3
BuildRequires: python3(wheel), python3(hatchling), python3(prettytable)
Requires: libgvdb-gir gpupdate >= 0.11.0
```

Куда положить сжатые исходники:
```spec
Source0: %name-%version.tar
```

Дальше идут стандартные секции spec файла:
- prep - подготовка к сборке (распаковка архива с исходником, применение патчей)
- build - компиляция и пр.
- install - разбрасываем по файловой системе продукты сборки
- files - указываем, какие именно файлы войдут в пакет
- post - скрипты постустановки

То, что начинается с процента, называется макросом
Макросы нужны, чтобы сократить количество текста. Узнать значение макроса можно с помощью `rpm --eval %_datadir`.
Увидеть все текстовые подстановки можно с помощью `rpm --showrc`, её удобно грепнуть и подсветить с помощью `| grep --color`

```spec
%description
gpresult is used to get the result set of Group Policies that apply to a user and/or computer in domain.
The utility allows you to display a list of domain  (GPO) policies that apply to the computer and user.

%prep
%setup -q

%build
%pyproject_build

%install
%pyproject_install
install -Dm0644 completions/%name %buildroot/%_datadir/bash-completion/completions/%name

%files
%python3_sitelibdir/%name
%python3_sitelibdir/%name/locales
%python3_sitelibdir/%name-%version.dist-info
%_bindir/%name
%_datadir/bash-completion/completions/%name
%exclude %python3_sitelibdir/%name/locales/en_US/LC_MESSAGES/*.po
%exclude %python3_sitelibdir/%name/locales/ru_RU/LC_MESSAGES/*.po

%changelog
* Fri Jan 31 2025 Maria Alexeeva <alxvmr@altlinux.org> 0.0.4-alt1
- Added translations for argparse and fixed typos (Closes: #52282)
- Removed repetitions when using the -l and -lr options (Closes: #52878)
- Added --width key to bash completions
```

```spec
Name:    my-hello
Version: 0.0.1
Release: alt1

Summary: Test package
License: GPLv3
Group:   Other
Url:     https://github.com/alxvmr/ssu_rpm/example

BuildRequires: gcc-c++ pkgconfig(glib-2.0)

Source0: %name-%version.tar

%description
This is a test package that outputs "Hello world!" to the console

%prep
%setup

%build
gcc main.c -o my_hello \
-I/usr/include/glib-2.0 \
-I/usr/lib64/glib-2.0/include \
-I/usr/include/pcre \
-lglib-2.0

%install
mkdir -p %buildroot%_bindir/
cp my_hello %buildroot%_bindir/my_hello

%files
%_bindir/my_hello

%changelog
* Tue Mar 11 2025 Maria Alexeeva <alxvmr@altlinux.org> 0.0.1-alt1
- Init build
```

А теперь добавим CMakeLists.txt:
```cmake
cmake_minimum_required(VERSION 3.5.0)
project(my_hello VERSION 0.1.0 LANGUAGES C)

find_package (PkgConfig REQUIRED)
pkg_check_modules (GLIB REQUIRED glib-2.0)

add_executable(${CMAKE_PROJECT_NAME} main.c)

target_include_directories (${CMAKE_PROJECT_NAME} PRIVATE ${GLIB_INCLUDE_DIR})
target_link_libraries (${CMAKE_PROJECT_NAME} PRIVATE ${GLIB_LIBRARIES})
target_compile_options (${CMAKE_PROJECT_NAME} PRIVATE ${GLIB_CFLAGS})

install (TARGETS ${CMAKE_PROJECT_NAME}
         DESTINATION /usr/bin)
```

```spec
Name:    my-hello
Version: 0.0.1
Release: alt1

Summary: Test package
License: GPLv3
Group:   Other
Url:     https://github.com/alxvmr/ssu_rpm/example

BuildRequires: gcc-c++ pkgconfig(glib-2.0)

Source0: %name-%version.tar

%description
This is a test package that outputs "Hello world!" to the console

%prep
%setup

%build
gcc main.c -o my_hello \
-I/usr/include/glib-2.0 \
-I/usr/lib64/glib-2.0/include \
-I/usr/include/pcre \
-lglib-2.0

%install
mkdir -p %buildroot%_bindir/
cp my_hello %buildroot%_bindir/my_hello

%files
%_bindir/my_hello

%changelog
* Tue Mar 11 2025 Maria Alexeeva <alxvmr@altlinux.org> 0.0.1-alt1
- Init build
```

// HACK: кажется, пора кончать с хорни шутками про лектора

С помощью `%define` можно задавать свои макросы.

Есть утилиты а-ля `github2spec`, чтобы автоматически генерировать каркас для будущего `SPEC` файла.

`rpm-build` --- система установки пакета по мясу. Чтобы его использовать, его надо предварительно установить на свою альтушку. // На Машу уже установлен.

```sh
find example-rpmbuild -type f ! -name '*.spec' | exec cp {} my-hello-.0.0.1`
```

```sh
cp my-hello-0.0.1.tar ~/RPM/SOURCES
cd ~/RPM/SOURCES
rpmbuild -ba SPECS/my_hello.spec
```

// HACK: пиздец душная лекция
// у Жени про го не так душно было
// да что там
// у Молчанова лучше было

```sh
cmake # создать файлы для сборки
cmake build # собрать проект
```

== GEAR

Удобный инструмент для интеграции rpm и git.

По умолчанию ищет SPEC файл в корне проекта. Идея в том, чтобы собирать проект произвольной структуры из git репозитория согласно конфигу .gear/rules

/* 
HACK:
```sh
touch Masha
```
*/

```rules
tar: .
spec: .gear/my-hello.spec
```

`rpm -Uvh` обновляет пакет из rpm файла

== Как пройти джойн?

Что даёт членство в Alt Linux Team?

- Право пушить пакеты в репозиторий
- Право собирать пакеты на серверах Альт Линукса

Примерно на этапе 3.6 дают доступ к гиту альт линукса.


