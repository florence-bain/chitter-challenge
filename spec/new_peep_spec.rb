require './lib/peep.rb'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

  #  peeps = Peep.create(url: "test comment", time: "11:15")
  #  Peep.create(url: "test peep", time: "10.20")
  #  Peep.create(url: "test message", time: "13.56")
    end 
  end 
  describe '.create' do 
    it 'creates a new peep' do 
      Peep.create(url: 'testing chitter')

      expect(Peep.all).to include 'testing chitter'
    end 
  end 
  
end 
