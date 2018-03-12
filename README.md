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

* params: `:name, :country`
* request format: `/api/v1/makes?makes[name]=<make_name>`
* request format example: `/api/v1/makes?makes[name]="Tesla"`

| Resources | Detail | Params |
| :-------- |:-------| :-------|
| GET `/api/v1/makes` | Index all makes | |
| GET `/api/v1/makes/:id` | Show single make | |
| POST `/api/v1/makes?params` | Create new make | required |
| PUT `/api/v1/makes/:id` | Update existing make | 1 or more required|
| DELETE `/api/v1/makes/:id` | Delete existing make | |


### Models
* belongs_to :make
* params: `:name, :base_price, :style, :make_id`
* request format: `/api/v1/models?model[name]=<model_name>`
* request format example: `/api/v1/models?model[name]="Model 3"`

| Resources | Detail | Params |
| :-------- |:-------| :-------|
| GET `/api/v1/models` | Index all models for a make | |
| GET `/api/v1/models/:id` | Show single model | |
| POST `/api/v1/models/?params` | Create new model | required |
| PUT `/api/v1/models/:id` | Update existing model | 1 or more required |
| DELETE `/api/v1/models/:id` | Delete existing model | |


### Vehicles
* belongs_to :make, :model
* params: `:nickname, :color, :mileage, :price, :make_id, :model_id`
* request format: `/api/v1/models?vehicle[nickname]=<vehicle_nickname>`
* request format example: `/api/v1/vehicles?vehicle[nickname]="White Lightning"?vehicle[mileage]=2000?vehicle[color]="White"`

| Resources | Detail | Params |
| :-------- |:-------|
| GET `/api/v1/vehicles` | Index all vehicles | |
| GET `/api/v1/vehicles/:id` | Show single vehicle | |
| POST `/api/v1/vehicles/?params` | Create new vehicle | required |
| PUT `/api/v1/vehicles/:id?` | Update existing vehicle | 1 or more required |
| DELETE `/api/v1/vehicles/:id` | Delete existing vehicle | |

### Options
* params: `:name, :cost`
* request format: `/api/v1/options?option[name]=<option_name>`
* request format example: `/api/v1/options?option[name]="Heated Seats"`

| Resources | Detail | Params |
| :-------- |:-------|
| GET `/api/v1/options` | Index all options | |
| GET `/api/v1/options/:id` | Show single option | |
| POST `/api/v1/options/?params` | Create new option | required |
| PUT `/api/v1/options/:id?` | Update existing option | 1 or more required |
| DELETE `/api/v1/options/:id` | Delete existing option | |


### Custom Endpoints

Vehicles
* `/api/v1/vehicles/find_all?color=Blue` returns all vehicles with given color
* `/api/v1/vehicles/:vehicle_id/options` returns collection of options for a given vehicle
* `/api/v1/vehicles/most_expensive` returns collection of 10 most expensive vehicles
* `/api/v1/vehicles/least_expensive` returns collection of 10 least expensive vehicles
* `/api/v1/vehicles/least_mileage` returns collection of 10 least mileage vehicles

## License

This project is licensed under the MIT License.
