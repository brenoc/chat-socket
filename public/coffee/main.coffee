do (jQuery, io) ->
  $ = jQuery
  $(document).ready () ->
    # you awesome code goes her

    socket = io()

    $('form').submit () ->
      message = $('#message-field').val()
      socket.emit('chat message', message)
      $('#message-field').val('')
      return false

    socket.on 'chat message', (msg) ->
      $('#messages').append($('<li>').text(msg))

    socket.on 'chat info', (msg) ->
      $('#messages').append($('<li class="text-muted">').text(msg))