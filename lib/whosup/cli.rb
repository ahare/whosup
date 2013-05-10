require "whosup"
require "thor"

module Whosup
  class CLI < Thor

    DEFAULT_PORT = 51703

    desc "server", "Start a Who's Up server."
    # method_option :port, aliases: "-p", default: DEFAULT_PORT, required: true
    # def server(port)
    def server
      Server.new.start(51703)
      # Server.new.start(port)
    end

    desc "client", "Start a Who's Up client."
    # method_option :server, aliases: "-s", required: true
    # method_option :port, aliases: "-p", default: DEFAULT_PORT, required: true
    # def client(server, port)
    def client
      # Client.new.start(server, port)
      Client.new.start("192.168.2.54", 51703)
    end

  end
end
