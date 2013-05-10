require "coreaudio"
require "socket"
require "multi_json"
require "artii"

module Whosup
  class Server

    def start

      puts "=" * Whosup::Terminal.columns
      puts Artii::Base.new.asciify("Who's Up?")
      puts "Waiting for the client to connect..."

      input = CoreAudio.default_input_device.input_buffer(1024)

      server = TCPServer.open(2000)
      client = server.accept
      input.start

      puts "Client connected!"
      puts "Press Ctl+C to shutdown the server..."

      puts "=" * Whosup::Terminal.columns

      loop do
        client.puts MultiJson.dump(input.read(4096).to_a)
      end
    end

  end

end
