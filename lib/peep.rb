require 'pg'

class Peep

  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end 

  def self.all()
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    peeps = connection.exec("SELECT * FROM peeps;")
    ordered_peeps = peeps.reverse_each
    ordered_peeps.map { |peep| Peep.new(id: peep['id'], content: peep['text'], time: peep['time']) }
  end 

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("INSERT INTO peeps (content, time) VALUES('#{content}', '#{Time.now}') RETURNING id, content, time")
    Peep.new(id: result[0]['id'], content: result[0]['text'], time: result[0]['time'])
  end
end 
