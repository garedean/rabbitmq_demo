require "bunny"

connection = Bunny.new(:automatically_recover => false)
connection.start

channel = connection.create_channel
queue    = channel.queue("task_queue", :durable => true)

# Don't dispatch a new message to a worker until it has processed and acknowledged the previous one.
channel.prefetch(1);

puts " [*] Waiting for messages in #{queue.name}. To exit press CTRL+C"

begin
  queue.subscribe(:manual_ack => true, :block => true) do |delivery_info, properties, body|
    puts " [x] Received '#{body}'"
    # imitate some work
    sleep 1.0
    puts " [x] Done"
    ch.ack(delivery_info.delivery_tag)
  end
rescue Interrupt => _
  conn.close
end
