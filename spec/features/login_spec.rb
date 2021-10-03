feature 'See what others are posting' do
  scenario 'view peeps' do
  visit('/peep')

  expect(page).to have_content "make a post"
  expect(page).to have_content "first post"
  expect(page).to have_content "I love coding"
  end 
end 