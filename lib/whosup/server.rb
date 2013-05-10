require "coreaudio"
require "socket"
require "multi_json"
require "artii"

module Whosup
  class Server

    def start(port)

      puts "=" * Whosup::Terminal.columns
      puts Artii::Base.new.asciify("Who's Up?")
      puts "Waiting for the client to connect..."

      server = TCPServer.open(port)
      client = server.accept

      puts "Client connected!"
      puts "Press Ctl+C to shutdown the server..."

      puts "=" * Whosup::Terminal.columns

      input = CoreAudio.default_input_device.input_buffer(1024)
      input.start

      loop do
        client.puts MultiJson.dump(input.read(4096).to_a)
      end
    end

  end

end
