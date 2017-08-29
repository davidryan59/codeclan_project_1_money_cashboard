# require_relative("model")
require_relative("category")
require_relative("month")

class Transaction < Model

  self.setup_info_store
  self.set_table_name("transactions")
  self.set_columns(["description", "value", "the_date", "month_id", "category_id"])

  attr_reader :id
  attr_accessor :description, :value, :the_date, :month_id, :category_id

  def category
    return find_parent(@category_id, Category)
  end
  def category_description
    return category.description
  end

  def display_date
    return @the_date    # IMPROVE: Get it formatted nicely here
  end
  def display_month
    return @the_date    # IMPROVE: Get month formatted nicely here
  end

  # When initialising a Transaction, want to put in
  # a month ID. This should be a single call to Month
  # to retrieve/create a new MOnth instance via database
  # def initialize(...)
  #   ..stuff
  #   super
  #   ...stuff
  # end
  # -- Want to round 'value' to 2 dps
  # -- Want to get a (possibly new) Month in which matches Date

  # # SAMPLE STATEMENTS
  # def months      # from Category
  #   return find_join('category_id', Transaction, 'month_id', Month)
  # end
  # def transactions
  #   return find_children("category_id", Transaction)
  # end

end
