This lesson demonstrates subscribing to only a specific subset of available messages.

# Receivers
1. In terminal: ruby receive_logs_direct.rb error
2. In terminal: ruby receive_logs_direct.rb info warning

# Publisher
3. ruby emit_log_direct.rb error "Run. Run. Or it will explode."

Take away: receivers can subscribe to specific types of messages.
