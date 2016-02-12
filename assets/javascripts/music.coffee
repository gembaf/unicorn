before = $('audio#before')[0]
win = $('audio#win')[0]
lose = $('audio#lose')[0]

img_win1 = $('.image.img_win1')
img_lose1 = $('.image.img_lose1')

btn_win = $('button#win')
btn_lose = $('button#lose')

before.src = "/audios/before.mp3"
before.addEventListener 'timeupdate', ->
  now = Math.floor(@currentTime)
  if @duration - now < 2
    btn_win.prop('disabled', false)
    btn_lose.prop('disabled', false)

# モーダルを閉じた時に全てリセットさせる
$('#myModal').on 'hidden.bs.modal', ->
  reset()

reset = ->
  stop before
  stop win
  stop lose
  btn_win.prop('disabled', true)
  btn_lose.prop('disabled', true)
  img_win1.hide()
  img_lose1.hide()
  $('div.buttons').show()

stop = (audio) ->
  audio.pause()
  audio.currentTime = 0

# なぜかbeforeらがundefinedになるので遅延させる
setTimeout ->
  $('button#start').click ->
    before.play()

  $('button#skip').click ->
    btn_win.prop('disabled', false)
    btn_lose.prop('disabled', false)

  btn_win.click ->
    win.play()
    img_win1.fadeIn(3000)
    $('div.buttons').hide()

  btn_lose.click ->
    lose.play()
    img_lose1.fadeIn(3000)
    $('div.buttons').hide()
, 500

# beforeが終わるまでは流ないので後からロード
setTimeout ->
  win.src = "/audios/win.mp3"
  lose.src = "/audios/lose.mp3"
, 1000

