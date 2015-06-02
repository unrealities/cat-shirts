# Cat Shirts

Basic sinatra app to serve up cat shirts!

Shirts are stored in `public/img`

## How to run the app
* `bundle install`
* `ruby shirts.rb`

App will run @ `http://127.0.0.1:4567/`

## Endpoints
* /shirt/:id
* /shirt/filename/:filename
* /shirt/random

All endpoints yield both text/html and json

json example:

```json
{
    "filename": "galaxy-cat-0.jpg",
    "url": "http://127.0.0.1:4567/img/galaxy-cat-0.jpg"
}
```
