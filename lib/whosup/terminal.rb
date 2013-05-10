module Whosup
  module Terminal

    def self.columns
      `tput cols`.chomp.to_i - 1
    end

  end
end
