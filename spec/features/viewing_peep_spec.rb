feature 'See what others are posting' do
  scenario 'view peeps' do

    Peep.create(content: "test comment")
    Peep.create(content: "test peep")
    Peep.create(content: "test message")

    visit('/peeps')

    expect(page).to have_content 'test comment'
    expect(page).to have_content 'test peep'
    expect(page).to have_content 'test message'
  end 

  scenario 'can see the time a peep was posted' do 
    allow(Time).to receive(:now).and_return(Time.parse("2021-10-10 10:15:20 +0100"))
    Peep.create(content: "Peep123")
    visit('/peeps')
    expect(page).to have_content('Peep123 10:15, 10th October')
  end 
end 