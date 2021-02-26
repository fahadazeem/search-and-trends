# README

A test project for HelpJuice

# Tech Stack
- Ruby => `2.7.0`
- Rails => `6.0.3.5`

# Dependencies
- `PostgreSQL` database.
- `Rspec` for testing
- `PG_Search` for searching

# Project Setup
After installing appropriate Ruby & Rails versions

1. Run `bundle install` in the project directory
2. Run `rails db:create`, do update/add the `database.yml` with your credentials before running this...
3. Run `rails db:migrate` to run database migrations
4. Run `rails db:seed` to populate the database
5. Run `rails server` to run the rails server on `localhost:3000`

# Implementation & Thought Process

As search was not the focus of this project, to save time, I've used `pg_search`.

As per my understanding, the goal of this assignment was to show trending searches (i.e. what people are searching)

So my algorithm is as follows
- I send a query to fetch the search results whenever there is a space after typed word (to save queries on each input)
- I show populate the dropdown with the search results so that user can select the appropriate article
- When user select the article I use that information to store the search as analytics (behind the scene I update the search count for that particular article)
- I've also added a `scope` to fetch trending searches
- On view side, I've used simple `HTML` with `Bootstrap` to show search box, searched article list, and trending searches
