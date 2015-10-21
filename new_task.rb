require "bunny"

connection = Bunny.new(:automatically_recover => false)
connection.start

channel = connection.create_channel
queue    = channel.queue("task_queue", :durable => true)

msg  = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

queue.publish(msg, :persistent => true)
puts " [x] Sent #{msg}"

sleep 1.0
conn.close
