require "whosup"
require "thor"

module Whosup
  class CLI < Thor

    desc "whosup start INSTANCE", "Start Whosup."
    method_option :instance, default: "server"
    def start(instance)
      if instance == "server"
        Server.start
      else

      end
    end

  end
end
