require_relative("model")

class Month < Model

  # Are these available in Ruby already?
  # @@month_short_names = ["Jan", "Feb",...]

  self.setup_info_store
  self.set_table_name("months")
  self.set_columns(["first_day_of_month"])

  attr_reader :id
  attr_accessor :first_day_of_month

  # # SAMPLE STATEMENTS
  # def months      # from Category
  #   return find_join('category_id', Transaction, 'month_id', Month)
  # end
  # def category
  #   return find_parent(@category_id, Category)
  # end
  # def transactions
  #   return find_children("category_id", Transaction)
  # end

end
