require_relative("model")

class Category < Model

  self.setup_info_store
  self.set_table_name("categories")
  self.set_columns(["description", "monthly_budget"])

  attr_reader :id
  attr_accessor :description, :monthly_budget

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
