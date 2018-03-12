# Vehicles API

![travis_status](https://travis-ci.org/podoglyph/vehicles_api_2.svg?branch=master)

A Rails JSON API for Vehicles, Makes, Models, and Options.

This app is built with:

* `Rails 5.1.5`
* `Ruby 2.4.1`
* `PostgreSQL 10.2`

To run:

1. Clone this repo and `cd vehicles_api_2`
3. `rails db:create`
4. `rails db:migrate`
5. `rails db:seed`
5.  Visit `localhost:3000` or use a HTTP client such as Postman to interact with the API using the docs below.

## API Documentation:

### Makes

`params: :name, :country`

| Resources | Detail | Params |
| :-------- |:-------| :------- |
| GET `/api/v1/makes` | Index all makes | |
| GET `/api/v1/makes/:id` | Show single make | :id |
| POST `/api/v1/makes?params` | Create new make | required |
| PUT `/api/v1/makes/:id` | Update existing make | 1 or more required|
| DELETE `/api/v1/makes/:id` | Delete existing make | |


### Models

| Resources | Detail |
| :-------- |:-------|
| GET `/api/v1/models` | Index all models for a make |
| POST `/api/v1/models/?model[name]=<model_name>?model[style]=<model_style>?model[base_price]=<model_base_price>` | Create new model |
| PUT `/api/v1/models/:id` | Update existing model |
| DELETE `/api/v1/models/:id` | Delete existing model |


### Vehicles

| Resources | Detail |
| :-------- |:-------|
| GET `/api/v1/vehicles` | Index all vehicles |
| GET `/api/v1/vehicles/:id` | Show single vehicle |
| PUT `/api/v1/vehicles/:id?vehicle[name]=<vehicle_name>` | Update existing vehicle |
| DELETE `/api/v1/vehicles/:id` | Delete existing vehicle |

## License

This project is licensed under the MIT License.
