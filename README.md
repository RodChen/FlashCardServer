Synopsis
--------

This project is a web server example which implements RESTFul user
authentication APIs, including user registration, login and logout. They are
built on Rails 4.2.3 and deployed to an Ubuntu machine. For detailed gem list,
refer to Gemfile.

Code Example
------------

Use a HTTP client to send HTTP request to the deployed server. Belows are APIs
and how to use them:

-   Register user

Send http POST to http://yourServer/api/v1/signup with content in the following
format:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"user":
 { "email": "name@example.com",
   "name": "NAME",
   "password": "Secret"
 }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

you will get a token like

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token": "TOKEN"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Login user

Send http POST to http://yourServer/api/v1/login with http header: Token =
token, and content in the following format:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"user":
 { "email": "name@example.com",
   "password": "Secret"
 }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

you will get a token like

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token": "TOKEN"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Logout user

Send http POST to http://yourServer/api/v1/logout with http header: Token =
token. The token value is what you get in login or signup method.

Motivation
----------

I attempted to develop user authentication APIs on server side which interacts
with mobile phones. I think this may be helpful for people who want to build
Rails API from the scratch.

Installation
------------

You need a server that can run Rails app, so you can deploy this project to it.
In my case, I use gem Capistrano 3.1 for deployment. If you want to use
Capistrano for deployment, you can just change server information in
config/deploy/staging.rb.

Tests
-----

There are some test cases in
/test/controllers/api/v1/users\_controller\_test.rb. In you console, you can run
those test cases by entering

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$bundle exec rake test TEST=test/controllers/api/v1/users_controller_test.rb
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

or simply enter

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$bundle exec rake test
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

to tell Rails to run all test cases.

License
-------

MIT license
