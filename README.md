# Funbox test task

Applications for viewing the dollar to ruble exchange rate. With the ability to create your own exchange rate.

## Getting Started
All requirements are described in <a href="https://dl.funbox.ru/qt-ruby.pdf" target="_blank">this</a> document.
Level III Q2

### Prerequisites

App uses <a href="https://www.postgresql.org/download/" target="_blank">postgresql</a> as DB.
Also, you need <a href="https://redis.io/topics/quickstart" target="_blank">redis</a> as DB for <a href="https://github.com/mperham/sidekiq" target="_blank">sidekiq</a>.

### Installing

After cloning the repository run the command
``` $ bundle install ```
If you want to use <a href="http://ddollar.github.io/foreman/" target="_blank">foreman</a>, please install it with
``` $ gem install foreman ```
And run app with comand
``` $ foreman start -f Procfile.dev ```
instead classic
``` $ sidekiq ```
``` $ rails s ```

## Running the tests

I use <a href="https://github.com/rspec/rspec-rails" target="_blank">rspec</a> for testing. You can run them with
``` $ rspec spec/ ```
