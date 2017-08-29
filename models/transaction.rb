# require_relative("model")
require_relative("category")
require_relative("month")

class Transaction < Model

  self.setup_info_store
  self.set_table_name("transactions")
  self.set_columns(["description", "value", "the_date", "month_id", "category_id"])

  attr_reader :id
  attr_accessor :description, :value, :the_date, :month_id, :category_id

  # When initialising a Transaction, want to put in
  # a month ID. This should be a single call to Month
  # to retrieve/create a new MOnth instance via database
  # def initialize(...)
  #   ..stuff
  #   super
  #   ...stuff
  # end

  # # SAMPLE STATEMENTS
  # def customers
  #   return find_join('screening_id', Ticket, 'customer_id', Customer)
  # end
  # def this_room
  #   return find_parent(@this_room_id, Room)
  # end
  # def doors
  #   return find_children("this_room_id", Door)
  # end

end
