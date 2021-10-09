require './lib/peep.rb'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

  #  peeps = Peep.create(url: "test comment")
  #  Peep.create(url: "test peep")
  #  Peep.create(url: "test message")
    end 
  end 
  describe '.create' do 
    it 'creates a new peep' do 
      Peep.create(url: 'testing chitter')

      expect(Peep.all).to include 'testing chitter'
    end 
  end 
  
end 
