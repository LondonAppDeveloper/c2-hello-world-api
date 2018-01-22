# C2 Hello World

Course 2 Hello World application backend.

## Steps

 - Add `.gitignore` for Python and Terraform ([gitignore.io](https://www.gitignore.io))
 - Setup Makefile with `env` and `install`
 - Create requirements file and installed
 - Create Django project `django-admin.py startproject hello_world_api`
 - Add `*.sqlite3` to `.gitignore`

 - Create `Dockerfile.dev`
 - Add `install-dev` to Makefile to install `docker-compose`
 - Create `docker-compose.yml` file
 - Run `docker-compose up --build`

 - Add `rest_framework` to `settings.py`
 - Create `views.py` in `hello_world_api/` with hello world view
 - Add `/api/hello_world` url



## Development Steps

Setup your environment by running:

```
make env
```

Switch to virtual environment:

```
source env/bin/activate
```

Install dev dependencies:

```
make install-dev
```
