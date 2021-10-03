feature 'See what others are posting' do
  scenario 'view peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'test comment');")
    connection.exec("INSERT INTO peeps VALUES(2, 'test peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'test message');")

    visit('/peeps')

    expect(page).to have_content 'test comment'
    expect(page).to have_content 'test peep'
    expect(page).to have_content 'test message'
  end  
end 