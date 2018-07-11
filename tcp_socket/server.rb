require 'socket'

server = TCPServer.new 2000

loop do
  client = server.accept
  puts client.readline
  client.close
end
