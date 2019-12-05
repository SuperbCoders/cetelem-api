# README

## System Information

* Ruby version:

`2.6.5`

* System dependencies:

Postgress, Redis, Ruby, bunlle

* Configuration

```ruby
bundle install
```

* Database creation

```ruby
bundle exec rake db:create
```

* Database initialization

```ruby
bundle exec rake db:migrate
```

* How to run the tests

```ruby
bundle exec rspec
```


## Http methods

```
GET     /sidekiq
POST   /api/v1/dealer_cars/:id/book
DELETE /api/v1/dealer_cars/destroy_list
GET    /api/v1/dealer_cars
GET    /api/v1/dealer_cars/:id
DELETE /api/v1/dealer_cars/:id
GET    /api/v1/dealers/:dealer_id/reservations
GET    /api/v1/dealers/:id/cars
POST   /api/v1/dealers/upload_xml
GET    /api/v1/dealers/:id
GET    /api/v1/filters/marks/:mark_id/models/:model_id/modifications
GET    /api/v1/filters/marks/:mark_id/models/:model_id/complectations
GET    /api/v1/filters/marks/:mark_id/models
GET    /api/v1/filters/marks
GET    /api/v1/filters/dealer_cars
GET    /api/v1/filters/extra_options
GET    /api/v1/filters/dealers
GET    /api/v1/current_user
GET    /api/v1/admin/users
POST   /api/v1/admin/users
GET    /api/v1/admin/users/:id
PATCH  /api/v1/admin/users/:id
PUT    /api/v1/admin/users/:id
DELETE /api/v1/admin/users/:id
GET    /api/v1/admin/reservations
GET    /api/v1/admin/reservations/:id
GET    /api/v1/admin/dealer_cars
POST   /api/v1/admin/dealer_cars
GET    /api/v1/admin/dealer_cars/:id
PATCH  /api/v1/admin/dealer_cars/:id
PUT    /api/v1/admin/dealer_cars/:id
DELETE /api/v1/admin/dealer_cars/:id
GET    /api/v1/admin/cars
GET    /api/v1/admin/cars/:id
PATCH  /api/v1/admin/cars/:id
PUT    /api/v1/admin/cars/:id
DELETE /api/v1/admin/cars/:id
POST   /api/v1/signup
POST   /api/v1/session
POST   /api/v1/refresh
```
