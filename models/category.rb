require('pry')

require_relative("model")
require_relative("transaction")

class Category < Model

  self.setup_info_store
  self.set_table_name("categories")
  self.set_columns(["description", "monthly_budget"])

  attr_reader :id
  attr_accessor :description, :monthly_budget

  def transactions
    return find_children("category_id", Transaction)
  end
  def number_of_transactions
    return transactions.size
  end
  def deletable?
    return editable? && number_of_transactions==0
  end
  def editable?
    return @description!="UNCLASSIFIED"
  end

end
