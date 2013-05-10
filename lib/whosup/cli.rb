require "whosup"
require "thor"

module Whosup
  class CLI < Thor

    desc "whosup start INSTANCE", "Start Whosup."
    method_option :instance, default: "server"
    def start(instance)
      Whosup.const_get(instance.capitalize).send :start
    end

  end
end
