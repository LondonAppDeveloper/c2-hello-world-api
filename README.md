<div align="center">
    <a href="https://londonappdeveloper.com" target="_blank">
        <img src="https://londonappdeveloper.com/wp-content/uploads/2024/11/banner.svg" alt="Banner image" />
    </a>
</div>

<div align="center">
    <p>Full-Stack Consulting and Courses.</p>
    <a href="https://londonappdeveloper.com" target="_blank">Website</a> |
    <a href="https://londonappdeveloper.teachable.com/" target="_blank">Courses</a> |
    <a href="https://londonappdeveloper.com/tutorials/" target="_blank">Tutorials</a> |
    <a href="https://londonappdeveloper.com/consulting/" target="_blank">Consulting
</div>

<br /><br >

# C2 Hello World API

Course 2 Hello World application backend.

## Steps

 - Add `.gitignore` for Python and Terraform ([gitignore.io](https://www.gitignore.io))
 - Setup Makefile with `env` and `install`
 - Create requirements file and installed
 - Create Django project `django-admin.py startproject hello_world_api`
 - Add `*.sqlite3` to `.gitignore`

 - Create `Dockerfile`
 - Add `install-dev` to Makefile to install `docker-compose`
 - Create `docker-compose.yml` file
 - Run `docker-compose up --build`

 - Add `rest_framework` to `settings.py`
 - Create `views.py` in `hello_world_api/` with hello world view
 - Add `/api/hello_world` url

 - Add Cors Headers

 - Create ECS Cluster
 - Create EC2 containers
 - Create SGs and Instance Profile

 - Create ECS Service
 - Create ECS Task
 - Create build and push script

## First Time Deployment

Create S3 Bucket:

```
aws s3 mb --region us-east-1 s3://c2-state-files
```
