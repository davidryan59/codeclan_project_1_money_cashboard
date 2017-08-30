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
  def transaction_count
    return transactions.size
  end
  def transaction_sum
    return transactions.inject(0){|memo, tr| memo + tr.value.to_f}.round(2)
  end
  def deletable?
    return editable? && transaction_count==0
  end
  def editable?
    return @description!="UNCLASSIFIED"
  end

end
