# countries02

This is an example of a Rails application using the GDS language to seed initial data into the database.

This example includes two Active Record models: Country and City.  
There is a one-to-many relationship between Country and City. One country has many cities.

![er diagram](https://github.com/uliramminger/gds-examples/blob/master/rails/countries02/er-diagram.svg)

Please take a look into the file [db/seeds.rb](https://github.com/uliramminger/gds-examples/blob/master/rails/countries02/db/seeds.rb)
which seeds initial data into the database.

## Getting Started

Enter the project folder
~~~
$ cd gds-examples/rails/countries02
~~~

Install the gems
~~~
$ bundle install
~~~

Create and seed the database
~~~
rails db:setup
~~~

Start the server
~~~
rails server
~~~

Open [http://localhost:3000](http://localhost:3000)

## Further Information

You will find further information here:  [urasepandia.de/gds.html](https://urasepandia.de/gds.html)

## Maintainer

Uli Ramminger <uli@urasepandia.de>

## Copyright

Copyright (c) 2018 Ulrich Ramminger

See MIT-LICENSE for further details.
