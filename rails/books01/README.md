# books01

This is an example of a Rails application using the GDS language to seed initial data into the database.

This example includes three Active Record models: Book, Author and Publication.  
There is a many-to-many relationship between Book and Author.
One book can be written by many (has many) authors and one author can write (has many) books.
The Publication model serves as a join model to setup the many-to-many relationship.

![er diagram](https://github.com/uliramminger/gds-examples/blob/master/rails/books01/er-diagram.svg)

Please take a look into the file [db/seeds.rb](https://github.com/uliramminger/gds-examples/blob/master/rails/books01/db/seeds.rb)
which seeds initial data into the database.
There are references used to establish the relationship between Book and Author.

## Getting Started

Enter the project folder
~~~
$ cd gds-examples/rails/books01
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
