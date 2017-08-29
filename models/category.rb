require_relative("model")

class Category < Model

  self.setup_info_store
  self.set_table_name("categories")
  self.set_columns(["description", "monthly_budget"])

  attr_reader :id
  attr_accessor :description, :monthly_budget

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
