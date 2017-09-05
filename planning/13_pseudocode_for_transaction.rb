
# THIS FILE IS NOT USED FOR CODE, ITS FOR PDA ONLY
# SEE MODELS DIRECTORY FOR THE LIVE FILE

require('date')
# require_relative("model")
require_relative("category")
require_relative("month")

class Transaction < Model

  def initialize(option_hash)
    # initialize superclass first
    # make a date instance variable (Date class) based on the_date text instance variable
    # extract its month and year as integers
    # make a month id based on year x 12 + month
    @private_date = Date.parse(@the_date)
    @private_month = @private_date.month
    @private_year = @private_date.year
    @month_id = @private_year * 12 + @private_month
  end

  def self.month_id_range
    # Retrieve transaction objects from all transactions in the database
    # return nil if there are no transactions
    # Map the array of transactions to their set of ids
    # The ids are numeric. Find their min and max, and return it
    trs = Transaction.all
    return nil if trs.size==0
    tr_month_ids = trs.map{|tr| tr.month_id}
    return (tr_month_ids.min .. tr_month_ids.max)
  end

  def self.all_in_month_and_category(month, category)
    # Given a particular month, find all the transactions in that month
    # Then filter these (using select) to just those in the correct category
    month_transactions = month.find_children("month_id", Transaction)
    return month_transactions.select{|t| t.category_id==category.id}
  end




  self.setup_info_store
  self.set_table_name("transactions")
  self.set_columns(["description", "value", "the_date", "month_id", "category_id"])

  attr_reader :id, :month_id
  attr_accessor :description, :value, :the_date, :category_id



  def category
    return find_parent(@category_id, Category)
  end
  def category_description
    return category.description
  end

  def display_date
    return @private_date
  end
  def display_month
    return "#{Month.name(@private_month)} #{@private_year}"
  end


  def self.all_in_category(category)
    return category.find_children("category_id", Transaction)
  end

  def self.all_in_month(month)
    return month.find_children("month_id", Transaction)
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
