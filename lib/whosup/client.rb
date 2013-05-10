require "socket"
require "narray"
require "multi_json"


module Whosup
  class Client

    def self.start

      meter = Meter.new
      output = CoreAudio.default_output_device.output_buffer(1024)

      host, port = "localhost", 2000

      output.start
      TCPSocket.open(host, port) do |socket|
        while message = socket.gets
          data = MultiJson.load(message)
          output << data
          meter << data
        end
      end
    end
  end

end
