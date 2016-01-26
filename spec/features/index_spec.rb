feature 'get /' do
  background do
    visit '/'
  end

  context 'ボタンを押す' do
    background do
      click_button '俺は…、行くよ。'
      wait_for_ajax
    end

    scenario 'モーダルが表示される', js: true do
      expect(page).to have_content '完全勝利'
    end

    scenario '完全勝利と完全敗北のボタンは押せない', js: true do
      within('div.buttons') do
        expect(page).to have_button '完全勝利', disabled: true
        expect(page).to have_button '完全敗北', disabled: true
      end
    end

    scenario '画像は隠れている', js: true do
      expect(page).to have_selector '.image.img_win1', visible: false
    end

    context '完全勝利&完全敗北ボタンが押せるようになる' do
      background do
        page.execute_script("$('button#win').prop('disabled', false)")
        page.execute_script("$('button#lose').prop('disabled', false)")
      end

      context '完全勝利ボタンを押す' do
        background do
          click_button '完全勝利'
          wait_for_ajax
        end

        scenario '完全勝利の画像が表示される', js: true do
          page.execute_script("$('.image.img_win1').show()")
          expect(page).to have_selector '.image.img_win1', visible: true
        end

        scenario '完全敗北の画像は表示されない', js: true do
          expect(page).to have_selector '.image.img_lose1', visible: false
        end

        scenario 'ボタンが消える', js: true do
          expect(page).to have_selector 'div.buttons', visible: false
        end
      end

      context '完全敗北ボタンを押す' do
        background do
          click_button '完全敗北'
          wait_for_ajax
        end

        scenario '完全敗北の画像が表示される', js: true do
          page.execute_script("$('.image.img_lose1').show()")
          expect(page).to have_selector '.image.img_lose1', visible: true
        end

        scenario '完全勝利の画像は表示されない', js: true do
          expect(page).to have_selector '.image.img_win1', visible: false
        end

        scenario 'ボタンが消える', js: true do
          expect(page).to have_selector 'div.buttons', visible: false
        end
      end
    end
  end
end

