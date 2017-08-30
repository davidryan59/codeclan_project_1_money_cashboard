require_relative( '../models/transaction.rb' )
# Transaction -> Month, Category -> Model -> SqlRunner

Transaction.delete_all
Category.delete_all
Month.delete_all
Model.delete_all

# Months

m6 = Month.new({ "first_day_of_month" => "2017-06-01" })
m7 = Month.new({ "first_day_of_month" => "2017-07-01" })
m8 = Month.new({ "first_day_of_month" => "2017-08-01" })
months = [m6, m7, m8]
months.each{|m| m.save}

# Categories

c_default = Category.new({ "description" => "UNCLASSIFIED" })
c_food = Category.new({ "description" => "Food", "monthly_budget" => "60" })
c_household = Category.new({ "description" => "Household" })
c_entertainment = Category.new({ "description" => "Entertainment", "monthly_budget" => "40" })
c_holiday = Category.new({ "description" => "Holiday" })
c_bills = Category.new({ "description" => "Bills" })
cats = [c_default, c_food, c_household, c_entertainment, c_holiday, c_bills]
cats.each{|c| c.save}

# Transactions

Transaction.new({
  "description" => "Wetherspoons Leith Walk",
  "value" => "10.89",
  "the_date" => "2017-06-25",
  "category_id" => c_default.id
}).save

Transaction.new({
  "description" => "Thomsons Flights",
  "value" => "189.76",
  "the_date" => "2017-07-14",
  "category_id" => c_holiday.id,
  "month_id" => m7.id
}).save

Transaction.new({
  "description" => "Savers Edinburgh",
  "value" => "33.09",
  "the_date" => "2017-07-20",
  "category_id" => c_default.id
}).save

Transaction.new({
  "description" => "B&Q Murrayfield",
  "value" => "60.00",
  "the_date" => "2017-07-31",
  "category_id" => c_default.id
}).save

Transaction.new({
  "description" => "Odeon Cinemas Edinburgh Central",
  "value" => "19.98",
  "the_date" => "2017-08-01",
  "category_id" => c_default.id
}).save

Transaction.new({
  "description" => "Edinburgh Council",
  "value" => "139.50",
  "the_date" => "2017-08-15",
  "category_id" => c_bills.id
}).save
