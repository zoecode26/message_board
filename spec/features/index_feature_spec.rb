feature 'Webpage displays content correctly' do
  scenario 'webpage displays title: Messages:' do
    visit '/'
    expect(page).to have_content('Message Board:')
  end

  scenario 'webpage displays add message button' do
    visit '/'
    expect(page).to have_button('New Message')
  end
end

feature "Displays messages entered by user" do
  scenario 'adding messages to message board' do
    visit('/')
    click_on 'New Message'
    fill_in "name", with: 'Bill'
    fill_in "message", with: 'Hi, everyone!'
    click_button 'Submit'
    expect(page).to have_content("Bill:\nHi, everyone!")
  end
end
