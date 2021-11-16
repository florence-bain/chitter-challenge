feature 'Adding new peep' do 
  scenario 'A user can add a new peep' do 
    visit('/peeps/new')
    fill_in('content', with: 'first post on chitter')
    click_button('Submit')

    expect(page).to have_content 'first post on chitter'
  end 
end 