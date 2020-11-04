feature 'user can fill out form for new message' do
  scenario 'page displays title' do
    visit '/'
    click_button 'New Message'
    expect(page).to have_content('New Message:')
  end

  scenario 'page has name textbox' do
    visit '/'
    click_button 'New Message'
    expect(page).to have_field('name')
  end

  scenario 'page has message textbox' do
    visit '/'
    click_button 'New Message'
    expect(page).to have_field('message')
  end

  scenario 'page has submit button' do
    visit '/'
    click_button 'New Message'
    expect(page).to have_button('Submit')
  end
end
