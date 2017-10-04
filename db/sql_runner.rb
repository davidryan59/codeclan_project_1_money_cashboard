require('pg')

class SqlRunner

  # @@dbname = 'money_cashboard'
  # @@hostname = 'localhost'

  def self.run(sql, values=[])
    begin

      # Locally hosted version (original project)
      # db = PG.connect({dbname: @@dbname, host: @@hostname })

      # Heroku hosted version (4th Oct 2017)
      db = PG.connect( {
        dbname: 'dfmp9a177jr6a5',
        host: 'ec2-54-225-237-64.compute-1.amazonaws.com',
        port: 5432,
        user: 'golozwrjowchmw',
        password: '770459eb89ca05859db776f46528090a47f155a488b7aeb2659669adbe6bee1b'
        })

      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close
    end
    return result
  end

end
