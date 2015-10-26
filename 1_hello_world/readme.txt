https://www.rabbitmq.com/tutorials/tutorial-one-ruby.html

This is a simple demonstration showcasing how one program (sender/producer/publisher) sends messages to a queue, then another program (receiver/consumer/subscriber) receives messages from the queue.

1. In a terminal, run the sender:   ruby send.rb
2. In a terminal, run the receiver: ruby receive.rb

Take away: The receiver will print the message it gets from the sender via RabbitMQ. The receiver will keep running, waiting for messages (Use Ctrl-C to stop it)
