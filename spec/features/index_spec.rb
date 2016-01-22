feature 'get /' do
  background do
    visit '/'
  end

  scenario do
    expect(page).to have_css 'button#start'
  end
end

