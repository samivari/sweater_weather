# Sweater Weather 
> A rails backend for a service oriented application. A user can request and receieve data from endpoints to plan road trips. Endpoints include querying weather forecasts for a destination, drive time between two destinations, and background image resources for the front end. 
Multiple API endpoints are consumed for each call, their data is integrated into the JSON body of sweater-weather's response. 
## Schema
```
  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "api_key"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
```

## Design Principles: 
The design of this application relies on the facade design pattern. Here's a very high level overview: 
* A controller receives a request from the front end and intiates the creation of a facade, and passes it data(params, from JSON or query). 
* A facade is a ruby class that initializes a Service, and sends the service data to a PORO. 
* A service calls an external api enpoint(get (https://web.site?optional_param) and returns parsed JSON. 
* The parsed JSON is turned into a Ruby object through a PORO. 
* The object is serialized and sent to the route matching the controller action. 


```
spec/poros/forecast_spec.rb
```

## Setup

1. clone this repository 
2. cd into 'sweater-weather' directory 
3. run ```'bundle install' to install gems```
4. run ```rake db:{drop,create,migrate} to prepare the database ```
6. run ```bundle exec rspec``` to run the test suite
7. run ```rails s``` to launch the production environment
8. send requests to "https://localhost:3000". 

I reccomend using Postman for the requests, as it's easy to format a request by adding it to the "raw body" of a 
POST request. 
```
hot tip: all post requests need to be sent with the JSON raw body!
```


### GET http://localhost:3000/api/v1/forecast?location=denver,co&Content-Type=application/json&Accept
```
Condensed Response: 
{"data":
  {"id":"null",
    "type":"forecast",
    "attributes":
      {"current_weather":
        {"datetime":"2022-04-26T13:47:35.000-06:00","sunrise":"2022-04-26T06:06:38.000-06:00","sunset":"2022-04-26T19:48:30.000-06:00","temperature":72.3,"feels_like":69.8,"humidity":12,"uvi":8.2,"visibility":10000,"conditions":null,"icon":"04d"},
         "daily_weather":
         [{"date":"2022-04-26","sunrise":"2022-04-26T06:06:38.000-06:00","sunset":"2022-04-26T19:48:30.000-06:00","max_temp":72.34,"min_temp":43.52,"conditions":"broken clouds","icon":"04d"},{"date":"2022-04-27","sunrise":"2022-04-27T06:05:20.000-06:00","sunset":"2022-04-27T19:49:30.000-06:00","max_temp":73.35,"min_temp":53.29,"conditions":"light rain","icon":"10d"},
         {"date":"2022-04-28","sunrise":"2022-04-28T06:04:02.000-06:00","sunset":"2022-04-28T19:50:31.000-06:00","max_temp":75.58,"min_temp":52.59,"conditions":"overcast clouds","icon":"04d"},{"date":"2022-04-29","sunrise":"2022-04-29T06:02:46.000-06:00","sunset":"2022-04-29T19:51:32.000-06:00","max_temp":61.54,"min_temp":51.82,"conditions":"scattered clouds","icon":"03d"},
         {"date":"2022-04-30","sunrise":"2022-04-30T06:01:31.000-06:00","sunset":"2022-04-30T19:52:33.000-06:00","max_temp":66.78,"min_temp":47.16,"conditions":"clear sky","icon":"01d"}],
       "hourly_weather":
          [{"time":"13:00:00","temperature":71.6,"conditions":"broken clouds","icon":"04d"},
          {"time":"14:00:00","temperature":72.3,"conditions":"broken clouds","icon":"04d"},
          {"time":"15:00:00","temperature":72.34,"conditions":"broken clouds","icon":"04d"},
          {"time":"16:00:00","temperature":72.27,"conditions":"broken clouds","icon":"04d"},
          {"time":"17:00:00","temperature":71.94,"conditions":"broken clouds","icon":"04d"},
          {"time":"18:00:00","temperature":72.27,"conditions":"overcast clouds","icon":"04d"},
          {"time":"19:00:00","temperature":70.29,"conditions":"overcast clouds","icon":"04d"},
          {"time":"20:00:00","temperature":67.3,"conditions":"overcast clouds","icon":"04n"}]
          }
    }
}
```
### POST http://localhost:3000/api/v1/users

```
JSON raw body:
{
  "email": "you@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
```
Response:
{
    "data": {
        "id": "2",
        "type": "users",
        "attributes": {
            "email": "sam@example.com",
            "api_key": "8a232e734270e093e960"
        }
    }
}
```
### POST http://localhost:3000/api/v1/users (sad path email taken) 
```
JSON raw body: 
{
  "email": "you@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
```
Response:
{
    "status": 400,
    "message": "Email has already been taken",
    "data": {
        "email": [
            "has already been taken"
        ]
    }
}
```

## Development setup
```ruby 2.7.4```
```rails 5.2.6```
## Gems
![pry v badge](https://img.shields.io/gem/v/pry?color=blue&label=pry)
![shoulda-matchers v badge](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers)
![rspec v badge](https://img.shields.io/gem/v/rspec?color=orange&label=rspec)
![simplecov v badge](https://img.shields.io/gem/v/simplecov?color=green&label=simplecov)
]![json-apiserializer](https://img.shields.io/badge/json-apiserializer-green)

