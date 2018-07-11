require 'socket'

PATH = '/tmp/qwe.sock'
`rm #{PATH}`

UNIXServer.open(PATH) do |server|
  loop do
    socket = server.accept
    puts socket.readline

    socket.close
  end
end
