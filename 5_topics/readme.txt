https://www.rabbitmq.com/tutorials/tutorial-five-ruby.html

Topics act as pattern matching logic. Similar to binding queues and exchanges based on a simplified REGEX-like format.

To receive all logs from the facility "kern":
1. Terminal: ruby receive_logs_topic.rb "kern.*"


Or if you want to hear only about "critical" logs:
2. Terminal: ruby receive_logs_topic.rb "*.critical"

3. Terminal: ruby emit_log_topic.rb "kern.critical" "A critical kernel error"
