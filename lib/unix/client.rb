require 'semantic_logger'
require 'socket'

SOCKET_PATH = '/tmp/qwe.sock'

class UNIXSocketAppender < SemanticLogger::Subscriber
  def initialize(socket_path: SOCKET_PATH, **args, &block)
    super(**args, &block)
    @socket_path = socket_path
    @unix_socket = UNIXSocket.new(socket_path)
  end

  def log(log)
    @unix_socket.write(formatter.call(log, self))
  end

  def default_formatter
    SemanticLogger::Formatters::Raw.new(time_format: :seconds, time_key: :timestamp)
  end
end

SemanticLogger.add_appender(appender: UNIXSocketAppender.new)

logger = SemanticLogger['Hello']

Runner.call do
  logger.info 'qwe'
end
