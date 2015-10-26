require "bunny"

# The conn abstracts the socket conn, and takes care of protocol version negotiation and authentication, among other things.
conn = Bunny.new(:automatically_recover => false)
conn.start

# Create a channel. Channels are where most of the API is in RabbitMQ for getting things done.
ch = conn.create_channel
# To send, we must declare a queue for us to send to; then we can publish a message to the queue.
q   = ch.queue("task_queue", :durable => true)

msg  = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

q.publish(msg, :persistent => true)
puts " [x] Sent #{msg}"

sleep 1.0
conn.close
