require "bunny"

conn = Bunny.new(:automatically_recover => false)
conn.start

ch = conn.create_channel
q  = ch.queue("task_queue", :durable => true)

# Don't give more than one message to a worker at a time, thus messages are picked up by workers as soon as a worker becomes available. Prevents 'round robin' type dispatching.
ch.prefetch(1)
puts " [*] Waiting for messages in #{q.name}. To exit press CTRL+C"

begin
  q.subscribe(:manual_ack => true, :block => true) do |delivery_info, properties, body|
    puts " [x] Received '#{body}'"
    # imitate some work
    sleep 1.0
    puts " [x] Done"
    # An ack(nowledgement) is sent back from the consumer to tell RabbitMQ that a particular message has been received, processed and that RabbitMQ is free to delete it.
    ch.ack(delivery_info.delivery_tag)
  end
rescue Interrupt => _
  conn.close
end
