feature 'See what others are posting' do
  scenario 'view peeps' do

    Peep.create(url: "test comment")
    Peep.create(url: "test peep")
    Peep.create(url: "test message")

    visit('/peeps')

    expect(page).to have_content 'test comment'
    expect(page).to have_content 'test peep'
    expect(page).to have_content 'test message'
  end 
end 