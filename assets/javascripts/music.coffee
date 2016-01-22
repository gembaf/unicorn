@BEFORE = $('audio#before')[0]

@BEFORE.addEventListener 'timeupdate', ->
  now = Math.floor(@currentTime)
  if @duration - now < 2
    $('button#win').prop('disabled', false)
    $('button#lose').prop('disabled', false)

setTimeout ->
  $('button#start').click ->
    @BEFORE.play()
, 1000

$('#myModal').on 'hidden.bs.modal', ->
  reset()

setTimeout ->
  reset = ->
    @BEFORE.pause()
    @BEFORE.currentTime = 0
    $('button#win').prop('disabled', true)
    $('button#lose').prop('disabled', true)
, 1000

