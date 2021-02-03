## JSON REST CRUD API - Tasks

---

![](api1.png)
![](api2.png)

---

## Stack

* <img alt="Ruby" src="https://img.shields.io/badge/ruby-%23CC342D.svg?&style=for-the-badge&logo=ruby&logoColor=white"/> as language.
* <img alt="Rails" src="https://img.shields.io/badge/rails%20-%23CC0000.svg?&style=for-the-badge&logo=ruby-on-rails&logoColor=white"/> as framework.
* <img alt="Postgres" src ="https://img.shields.io/badge/postgres-%23316192.svg?&style=for-the-badge&logo=postgresql&logoColor=white"/> as database.
* <img alt="Heroku" src="https://img.shields.io/badge/heroku%20-%23430098.svg?&style=for-the-badge&logo=heroku&logoColor=white"/> for continuous-deployment in production (with always forced SSL connection)
* <img alt="TravisCI" src="https://img.shields.io/badge/travisci%20-%232B2F33.svg?&style=for-the-badge&logo=travis&logoColor=white"/> for continuous-integration
* <img alt="Git" src="https://img.shields.io/badge/git%20-%23F05033.svg?&style=for-the-badge&logo=git&logoColor=white"/><img alt="GitHub" src="https://img.shields.io/badge/github%20-%23121011.svg?&style=for-the-badge&logo=github&logoColor=white"/> for version control, in this project I have learned branching, pull requests and merging. 
* **RSpec, FactoryBot, Shoulda-Matchers, Guard-RSpec, Database-Cleaner** as test suite stack.
* gem **JWT** as a service for User authentication.
* gem **will_paginate** for pagination.
* gem **active_model_serializers** for Task data serialization.
* gem **bcrypt** for User secure_password.
* gem **rubocop** for static-code-analysis
* gem **brakeman** for security vulnerability checks.
* gem **bundler-audit** for Bundler security verification
* gem **bullet** in development for killing n+1 queries.
* gem **strong_migrations** in development for unsafe migrations.
* gem **better_errors** in development for cleaner errors.
* gem **pry** for debugging.
* gem **faker** for seed sample data.

---

## Run app with HTTPie

`rails s` to run the server

`http :3000/signup name=ash email=test@email.com password=foobar password_confirmation=foobar` to sign-up and get authorization token

`http :3000/auth/login email=test@email.com password=foobar` to log-in

`http :3000/tasks page==2 Accept:'application/vnd.tasks.v1+json' Authorization:'token'` to see all Tasks with pagination and default V1 version

`http POST :3000/tasks/1/points name='Listen to Don Giovanni' Accept:'application/vnd.tasks.v1+json' Authorization:'token'` to post new point of TASK with ID 1

---

## Configuration & dependencies

### System dependencies

`Ruby: 2.7.2p137`

`Rails: 6.0.3.4`

`database: postgresql`

### Configuration

`git clone https://github.com/tmtocb/tasks-JSON-REST-API-TDD`

`bundle install`


### Database

`rails db:drop db:create db:migrate`

`rails db:seed` to seed database with faker data

### Run the app

`rails s`


### Development tools

`binding.pry` to debug

`rubocop` for static-code-analysis

`brakeman` for security vulnerability checks.

`bundler-audit` for Bundler security verification


### Run tests

`rspec` to run full test suite

`guard` for autotests live in development