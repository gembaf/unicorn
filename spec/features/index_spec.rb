feature 'get /' do
  background do
    visit '/'
  end

  scenario 'ボタンを押すとモーダルが表示される', js: true do
    click_button '俺は…、行くよ。'
    wait_for_ajax
    expect(page).to have_content '完全勝利'
  end
end

