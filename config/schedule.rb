every 30.minutes do
  runner "ChatCountUpdater.perform_async", environment: 'production', output: { error: '/app/log/cron_error.log', standard: '/app/log/cron.log' }
  runner "MessageCountUpdater.perform_async", environment: 'production', output: { error: '/app/log/cron_error.log', standard: '/app/log/cron.log' }
end
