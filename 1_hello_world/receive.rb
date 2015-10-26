require "bunny"

conn = Bunny.new(:automatically_recover => false)
conn.start

ch   = conn.create_channel
q    = ch.queue("hello")

begin
  puts " [*] Waiting for messages. To exit press CTRL+C"
  # Since messages are pushed to the consumer asynchronously, the 'subscribe' callback is provided that gets executed when RabbitMQ pushes messages to the consumer.
  q.subscribe(:block => true) do |delivery_info, properties, body|
    puts " [x] Received #{body}"
  end
rescue Interrupt => _
  conn.close

  exit(0)
end
