# Require the RabbitMQ library.
require "bunny"

# Connect to RabbitMQ server. The connection abstracts all socket connection, protocal, and authentication logic.
conn = Bunny.new(:automatically_recover => false)
conn.start

# Create a channel which is where most of the API for getting things done.
ch   = conn.create_channel
# To send, we must declare a queue for us to send messages to.
q    = ch.queue("hello")

# Publish a message to the queue.
ch.default_exchange.publish("Hello World!", :routing_key => q.name)
puts " [x] Sent 'Hello World!'"

# Close the connection.
conn.close
