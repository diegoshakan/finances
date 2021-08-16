# README - Gerenciador de Finanças
![GitHub top language](https://img.shields.io/github/languages/top/diegoshakan/catarsinho)
![GitHub language count](https://img.shields.io/github/languages/count/diegoshakan/catarsinho)
![GitHub repo size](https://img.shields.io/github/repo-size/diegoshakan/catarsinho)

Click here to visit: [take-the-control](https://take-the-control.herokuapp.com/)
<p>This Web App is a little app based on kakeibo philosophy.</p>


## Pre-requisites

* Ruby '3.0.1'
* Rails 6.0.3
* Bundler 2.1.4
* Postgresql 10.10

## Setup Project

* $ git clone https://github.com/diegoshakan/finances.git
* $ cd finances
* $ rails db:create db:migrate
* $ bundle install
* if your system ask for Yarn, please type $ yarn install or just $ yarn
* After all, run $ rails s -b 0.0.0.0

## Web App
* You can register an user and submit your receivables and payments;
* You can see all information about your finances, include total balance;
* All entries/exits are detailed by months;
* More features are builds, for further information and if you want help, access [issues](https://github.com/diegoshakan/finances/issues).

more about app informations:
I used bootstrap by CND setting to make style.

## Tests and Development librarys (gems)
Main gems
* Simple-form
* Devise
* Rspec-rails
* Factory_bot_rails
* FFaker
