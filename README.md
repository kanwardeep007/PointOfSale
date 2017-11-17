README

Things to do to setup the project are as follows

Type the following commands on terminal
-> bundle install
-> rake db:create
-> rake db:migrate
-> rake db:seed


Launch the server with
-> rails s


Structure is as follow 

1. Bill has various orders
2. Order is like a single line in a Bill receipt
3. Order has a particular item, quantity , sale_price  and final_price (sale_price + taxes)

For searching items by hashag first add an order to Bill then type hashtag you want to search in search bar and hit search. The drop down  will change according to hashtag (for last order only).

format for hashtag search (example)
1.dinner,bread
2.veg


Enjoy :)