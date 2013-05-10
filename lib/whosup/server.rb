require "coreaudio"
require "socket"
require "multi_json"

module Whosup
  class Server

    def self.start

      input = CoreAudio.default_input_device.input_buffer(1024)

      server = TCPServer.open(2000)
      puts "#{"="*80}\nstarting server\n#{"="*80}"
      client = server.accept
      puts "#{"="*80}\nclient accepted\n#{"="*80}"
      input.start

      loop do
        client.puts MultiJson.dump(input.read(4096).to_a)
      end
    end

  end
end
