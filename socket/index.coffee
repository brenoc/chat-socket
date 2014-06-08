
SocketIo = require('socket.io')

class Socket
  constructor: (server) ->
    io = new SocketIo(server)

    io.on 'connection', (socket) ->
      io.emit('chat info', "New person connected")
      socket.on 'chat message', (msg) ->
        io.emit('chat message', msg)        

module.exports = Socket