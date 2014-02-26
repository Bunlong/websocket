require 'eventmachine'
require 'em-websocket'
 
EventMachine.run {
  EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8080) do |ws|
    ws.onopen {
      puts "WebSocket connection open"
    }

    ws.onmessage { |msg|
      puts msg
      ws.send(msg)
    }

    ws.onclose {
      puts "WebSocket connection closed"
    }
  end
}