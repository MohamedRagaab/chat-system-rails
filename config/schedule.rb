every 5.minutes do
  runner "ChatCountUpdater.perform_now"
  runner "MessageCountUpdater.perform_now"
end
