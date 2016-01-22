feature 'get /' do
  background do
    visit '/'
  end

  scenario 'ボタンを押すとモーダルが表示される', js: true do
    click_button '俺は…、行くよ。'
    expect(page).to have_content 'hoge'
  end
end

