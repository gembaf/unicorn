before = $('audio#before')[0]
win = $('audio#win')[0]
lose = $('audio#lose')[0]

before.src = "/audios/before.mp3"
before.addEventListener 'timeupdate', ->
  now = Math.floor(@currentTime)
  if @duration - now < 2
    $('button#win').prop('disabled', false)
    $('button#lose').prop('disabled', false)

# モーダルを閉じた時に全てリセットさせる
$('#myModal').on 'hidden.bs.modal', ->
  reset()

reset = ->
  stop before
  stop win
  stop lose
  $('button#win').prop('disabled', true)
  $('button#lose').prop('disabled', true)
  $('img#img_win1').hide()
  $('img#img_lose1').hide()
  $('div.buttons').show()

stop = (audio) ->
  audio.pause()
  audio.currentTime = 0

# なぜかbeforeらがundefinedになるので遅延させる
setTimeout ->
  $('button#start').click ->
    before.play()

  $('button#win').click ->
    win.play()
    $('img#img_win1').fadeIn(3000)
    $('div.buttons').hide()

  $('button#lose').click ->
    lose.play()
    $('img#img_lose1').fadeIn(3000)
    $('div.buttons').hide()
, 500

# beforeが終わるまでは流ないので後からロード
setTimeout ->
  win.src = "/audios/win.mp3"
  lose.src = "/audios/lose.mp3"
, 5000

