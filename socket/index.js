(function() {
  var Socket, SocketIo;

  SocketIo = require('socket.io');

  Socket = (function() {
    function Socket(server) {
      var io;
      io = new SocketIo(server);
      io.on('connection', function(socket) {
        io.emit('chat info', "New person connected");
        return socket.on('chat message', function(msg) {
          return io.emit('chat message', msg);
        });
      });
    }

    return Socket;

  })();

  module.exports = Socket;

}).call(this);
