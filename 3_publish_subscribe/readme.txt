https://www.rabbitmq.com/tutorials/tutorial-three-ruby.html

This part demonstrates delivering a message to multiple consumers. This pattern is known as "publish/subscribe".

1. Open two terminals: ruby receive_logs.rb
2. Open a terminal:    ruby emit_logs.rb

Take away: single messages in queues can be broadcast to all receivers.
