require 'pg'

class Peep

  def self.all()
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'chitter_test')
    # else
    #   connection = PG.connect(dbname: 'chitter')
    # end
    connection = PG.connect(dbname: 'chitter_test')
    peeps = connection.exec("SELECT * FROM peeps;")
    ordered_peeps = peeps.reverse_each
    ordered_peeps.map { |peep| peep['url']}
    
    
  end 
end 
