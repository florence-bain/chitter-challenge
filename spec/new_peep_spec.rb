require './lib/peep.rb'

describe Peep do

  let(:peeps) { Peep.new}
  
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

  #  peeps = Peep.create(content: "test comment")
  #  Peep.create(content: "test peep")
  #  Peep.create(content: "test message")
    end 
  end 
  describe '.create' do 
    it 'creates a new peep' do 
      Peep.create(content: 'testing chitter')

      expect(Peep.all).to include 'testing chitter'
    end

    it 'returns the time a peep was posted' do
      allow(Time).to receive(:now).and_return(Time.parse("2021-11-15 11.11 +0100"))
      Peep.create(content: 'first peep')
      allow(Time).to receive(:now).and_return(Time.parse("2021-11-15 11.15 +0100"))
      Peep.create(content: 'second peep')
      
  
      expect(peeps.first.text).to eq 'second peep'
    end 
  end 
  
end 
