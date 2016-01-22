
setTimeout ->
  BEFORE = $('audio#before')[0]
  BEFORE.addEventListener 'timeupdate', ->
    now = Math.floor(@currentTime)
    if @duration - now < 2
      $('button#win').prop('disabled', false)
      $('button#lose').prop('disabled', false)

  WIN = $('audio#win')[0]
  LOSE = $('audio#lose')[0]

  $('button#start').click ->
    BEFORE.play()

  $('button#win').click ->
    WIN.play()

  $('button#lose').click ->
    LOSE.play()

  reset = ->
    BEFORE.pause()
    BEFORE.currentTime = 0
    WIN.pause()
    WIN.currentTime = 0
    LOSE.pause()
    LOSE.currentTime = 0
    $('button#win').prop('disabled', true)
    $('button#lose').prop('disabled', true)

  $('#myModal').on 'hidden.bs.modal', ->
    reset()
, 100

