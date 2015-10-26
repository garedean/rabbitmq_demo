https://www.rabbitmq.com/tutorials/tutorial-two-ruby.html

In this demonstration, a single work queue is created that distributes time-consuming tasks to multiple workers.

The main idea behind Work Queues (aka: Task Queues) is to avoid doing a resource-intensive task immediately and having to wait for it to complete. Instead we schedule the task to be done later.

This concept is especially useful in web applications where it's impossible to handle a complex task during a short HTTP request window.

1. In a terminal, run the sender:   ruby new_task.rb
2. In a terminal, run the receiver: ruby worker.rb

Take away: messages in a queue can be dispatched to many workers.
