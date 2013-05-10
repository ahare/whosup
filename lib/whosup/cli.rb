require "whosup"
require "thor"

module Whosup
  class CLI < Thor

    desc "whosup start INSTANCE", "Start Who's Up."
    method_option :instance, default: "server"
    def start(instance)
      Whosup.const_get(instance.capitalize).new.send :start
    end

  end
end
