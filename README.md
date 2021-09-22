# README

## Ruby version

-   ruby '2.7.2'
-   rails '6.1.4'

## System dependencies

-   Clone down this repo using the `SSH` link in the `Code` tab at the top of this page.
-   `CD` into file
-   Run `bundle install`

## Database creation

From your terminal:

-   Run `rails db:create`

## Database initialization

From your terminal:

-   Run `rails db:migrate`

## How to run the test suite

From your terminal:

-   Run  `bundle exec rspec` or
-   Run `bundle exec rspec -f d` for a detailed result.


## Endpoints Created In Project

#### See all customer subscriptions
``` 
http://localhost:3000/api/v1/customers/8/subscriptions
```
```
{
    "data": [
        {
            "id": "21",
            "type": "subscription",
            "attributes": {
                "customer_id": 8,
                "tea_id": 1,
                "is_active": true,
                "frequency": 30
            }
        },
        {
            "id": "22",
            "type": "subscription",
            "attributes": {
                "customer_id": 8,
                "tea_id": 5,
                "is_active": true,
                "frequency": 30
            }
        }
    ]
}
```
#### Create a Subscription 
```
http://localhost:3000/api/v1/customers/1/subscriptions
```
##### Input: 
```
{
  "tea_id": 9,
  "frequency": 15
}
```
##### Result:
```
{
    "data": {
        "id": "28",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 9,
            "is_active": true,
            "frequency": 15
        }
    }
}
```

#### Unsubscribe a Customer

```
http://localhost:3000/api/v1/customers/1/subscriptions/2
```
##### Input: 
```
{
  "is_active": false
}
```
##### Result:
```
{
    "data": {
        "id": "2",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 2,
            "is_active": false,
            "frequency": 30
        }
    }
}
```

## Schema

<img width="613" alt="Screen Shot 2021-09-22 at 11 39 55 AM" src="https://user-images.githubusercontent.com/54419240/134394400-95ddf3a1-c66e-409c-b36e-bbd1f2162408.png">

  
## Where to Find Me 
    
- Regina Casias [GitHub](https://github.com/rcasias)
- Regina Casias [LinkedIn](https://www.linkedin.com/in/regina-casias-0a6b78196/) 
    
