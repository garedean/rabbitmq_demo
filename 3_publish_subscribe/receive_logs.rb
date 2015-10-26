require "bunny"

conn = Bunny.new
conn.start

ch  = conn.create_channel
x   = ch.fanout("logs")
q   = ch.queue("", :exclusive => true)

# A binding is a relationship between an exchange and a queue. This can be simply read as: the queue is interested in messages from this exchange.
q.bind(x)

puts " [*] Waiting for logs. To exit press CTRL+C"

begin
  q.subscribe(:block => true) do |delivery_info, properties, body|
    puts " [x] #{body}"
  end
rescue Interrupt => _
  ch.close
  conn.close
end
