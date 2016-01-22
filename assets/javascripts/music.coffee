$ ->
  BEFORE = $('audio#before')[0]

  $('button#start').click ->
    BEFORE.play()

  $('#myModal').on 'hidden.bs.modal', ->
    BEFORE.pause()
    BEFORE.currentTime = 0

