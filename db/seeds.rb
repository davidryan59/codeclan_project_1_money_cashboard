# require('pry')
require_relative( '../models/transaction.rb' )
# Transaction -> Month, Category -> Model -> SqlRunner

Transaction.delete_all
Category.delete_all
Month.delete_all
Model.delete_all

# Months, Model - dummy tables, no records needed

# Categories

c_default = Category.new({ "description" => "UNCLASSIFIED", "monthly_budget" => "0" })
c_food = Category.new({ "description" => "Food", "monthly_budget" => "257" })
c_household = Category.new({ "description" => "Household", "monthly_budget" => "83" })
c_entertainment = Category.new({ "description" => "Entertainment", "monthly_budget" => "139" })
c_holiday = Category.new({ "description" => "Holiday", "monthly_budget" => "127" })
c_bills = Category.new({ "description" => "Bills", "monthly_budget" => "211" })
c_clothes = Category.new({ "description" => "Clothes", "monthly_budget" => "47" })
cats = [c_default, c_food, c_household, c_entertainment, c_holiday, c_bills, c_clothes]
cats.each{|c| c.save}

# Transactions

Transaction.new({
  "description" => "Wetherspoons Leith Walk",
  "value" => "10.89",
  "the_date" => "2017-06-25",
  "month_id" => 2017 * 12 + 6,
  "category_id" => c_default.id
}).save

Transaction.new({
  "description" => "Thomsons Flights",
  "value" => "189.76",
  "the_date" => "2017-07-14",
  "month_id" => 2017 * 12 + 7,
  "category_id" => c_holiday.id,
}).save

Transaction.new({
  "description" => "Savers Edinburgh",
  "value" => "33.09",
  "the_date" => "2017-07-20",
  "month_id" => 2017 * 12 + 7,
  "category_id" => c_default.id
}).save

Transaction.new({
  "description" => "B&Q Murrayfield",
  "value" => "60.00",
  "the_date" => "2017-07-31",
  "month_id" => 2017 * 12 + 7,
  "category_id" => c_default.id
}).save

Transaction.new({
  "description" => "Odeon Cinemas Edinburgh Central",
  "value" => "19.98",
  "the_date" => "2017-08-01",
  "month_id" => 2017 * 12 + 8,
  "category_id" => c_default.id
}).save

Transaction.new({
  "description" => "Edinburgh Council",
  "value" => "139.50",
  "the_date" => "2017-08-15",
  "month_id" => 2017 * 12 + 8,
  "category_id" => c_bills.id
}).save

# Generate some more random ones
details = [
    "Sainsburys", "BP Fuel", "Waitrose", "Gap", "Microsoft",
    "Tesco", "Shell Fuel", "Harvey Nichols", "New Look", "Costa",
    "Thomsons", "Greggs", "Code Clan", "Prezzo", "Loch Fyne",
    "River Island", "Esso", "Lidl", "Aldi", "Primark",
    "Debenhams", "Lush Edinburgh", "Zara", "McDonalds", "KFC",
  ]
100.times do
  detail = details.sample
  category = cats.sample
  category = [c_default, c_default, category, category, category].sample
  day = (1..28).to_a.sample
  month = (1..12).to_a.sample
  year = (2016..2017).to_a.sample
  the_date = "#{year}-#{sprintf("%02d",month)}-#{sprintf("%02d",day)}"
  month_id = year * 12 + month
  options_hash = {
    "description" => detail,
    "value" => (10**(rand*2.5)).round(2),
    "the_date" => the_date,
    "month_id" => month_id,
    "category_id" => category.id
  }
  # binding.pry
  Transaction.new(options_hash).save
end
