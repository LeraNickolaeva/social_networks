# README

## About the application:

Social Networks application returns JSON with array of tweets for Twitter, photos for Instagram and statuses for Facebook.<br />
For this, asynchronous requests are made to the following urls:
- https://takehome.io/twitter
- https://takehome.io/facebook
- https://takehome.io/instagram

If an error is returned, the request will be repeated automatically.<br />
There are 3 attempts for this.<br />
If all attempts fail, the result will be an empty array.

## How to setup the application:
```sh
git clone ...
bundle install
```

## How to run the application:

```sh
rails server -e production
```

Note: Please run server in production mode for correct work of threads

```sh
curl localhost:3000
```

## How to run tests:
```sh
bundle exec rspec ./spec
```
