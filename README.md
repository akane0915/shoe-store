# _The Shoe Store_

#### _A web application for a shoe company to to track various shoe brands and the stores at which each brand is sold.  Each store sells many shoe brands and each brand is sold at many stores.  May 12, 2017_

#### By _**Asia Kane**_

## Description

This application is intended for a shoe company to use internally to track various shoe brands and the stores at which each brand is sold. The application can store multiple shoe brands and multiple shoe stores and practices a many-to-many relationship.

The application contains two database tables: brands and stores. This application uses RESTFUL routing.  

![SQL DB structure](/public/img/sql-database.png)

The following user stories have been met for this application:

* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add and list new shoe brands. Shoe brands should include price.
* As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
* As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
* As a user, I want to be able to associate the same brand of shoes with multiple stores.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I want the price to be in currency format even if I just inputted a number. (In other words, typing in 50 should be updated to $50.00.)
* As a user, I do not want stores and/or shoe brands to be saved if I enter a blank name.
* As a user, I want all stores and brands to be unique. There shouldn't be two entries in the database for Blundstone.
* As a user, I want store and brand names to have a maximum of one hundred characters.


### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby
Bundler

## Specifications
| Behavior |  Input   |  Output  |
|----------|:--------:|:--------:|



## Setup/Installation Requirements
           _
* _Set up a production database and a development database in SQL (see instructions below)_
* _In another terminal window, clone this repository to your machine and navigate to the file path in your terminal._
* _Run $bundle_
* _Run $ruby app.rb_
* _Type localhost:4567 in a browser window to view application_
* _If you would like to make changes, open files in text editor of your choice_
* _Make changes as desired_
* _Make frequent commits with detailed comments_
* _Submit changes as pull request to Asia at akane0915 on Github_

## Database Setup Instructions

* _If Postgres is not installed on your computer, follow these instructions https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef_
* _run $postgres in your terminal window and leave it running_
* _In another terminal window, run $psql_
* _Type the following:_

* _CREATE DATABASE volunteer_tracker;_
* _\c volunteer_tracker_
* _CREATE TABLE projects (id serial PRIMARY KEY, title varchar);_
* _CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, hours int, project_id int);_
* _CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;_

## Known Bugs
_N/A_

## Support and contact details
_I encourage you to update/make suggestions/refactor this code as you see fit. I am always open to improvement! Please contact Asia Kane at asialkane@gmail.com with questions._

## Technologies Used
* Ruby
* Sinatra
* SQL Relational Database Management System
* Postgres Database Management System
* Psql
* Capybara Integration Testing
* Rspec Gem
* Pg Gem
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/


### License
*This software is licensed under the MIT license*
Copyright © 2017 **Asia Kane**