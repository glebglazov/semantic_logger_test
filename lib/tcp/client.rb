require 'semantic_logger'

SemanticLogger.add_appender(
  appender: :graylog,
  url:      'tcp://localhost:2000'
)

logger = SemanticLogger['Hello']

Runner.call do
  logger.info 'Hi'
end
