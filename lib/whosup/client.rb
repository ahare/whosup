require "socket"
require "narray"
require "multi_json"

module Whosup
  class Client

    def self.start

      outbuf = CoreAudio.default_output_device.output_buffer(1024)

      host, port = "localhost", 2000

      outbuf.start
      TCPSocket.open(host, port) do |socket|
        while message = socket.gets
          outbuf << MultiJson.load(message)
        end
      end
    end
  end

end
