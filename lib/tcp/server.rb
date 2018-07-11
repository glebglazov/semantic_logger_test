require 'socket'

TCPServer.open(2000) do |server|
  loop do
    client = server.accept
    puts client.readline
    client.close
  end
end
