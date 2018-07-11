require 'socket'

server = UNIXServer.new('/tmp/qwe.sock')

puts "==== Waiting for connection"
loop do
  socket = server.accept
  puts "==== Got Request:"
  puts socket.readline

  socket.close
end
