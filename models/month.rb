# require_relative("model")
require_relative("transaction")

class Month < Model
  # Not actually stored in the database,
  # but the find_child method needed

  self.setup_info_store
  self.set_table_name("months")
  self.set_columns([""])

  @@month_names = [
      "Jan", "Feb", "Mar", "Apr",
      "May", "June", "July", "Aug",
      "Sept", "Oct", "Nov", "Dec"
    ]

  def self.names
    return @@month_names
  end

  def self.name(month_num)
    return @@month_names[month_num-1]
  end

  attr_reader :id

  def initialize(id)
    @id = id.to_i
    @private_month = ( @id%12==0 ? 12 : @id%12)
    @private_year = (@id - @private_month) / 12
  end

  def self.all
    return Transaction.month_id_range.map{|id| Month.new(id)}
  end

  def self.find(id)
    return Month.new(id)
  end

  def display
    return "#{Month.name(@private_month)} #{@private_year}"
  end

  def transactions
    return find_children("month_id", Transaction)
  end
  def transaction_count
    return transactions.size
  end
  def transaction_sum
    return transactions.inject(0){|memo, tr| memo + tr.value.to_f}.round(2)
  end

end
