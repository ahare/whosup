module Whosup
  class Meter

    MAX = 15_000.0

    def <<(data)
      level = data.map(&:first).map(&:abs).reduce(:+) / data.size
      percent = level / MAX
      percent = 1 if percent > 1
      bars = (percent * columns).to_i
      print "\r"
      (0..bars).each do |i|
        color = 32 if i <= (columns * 0.5).to_i
        color = 33 if i > (columns * 0.5).to_i
        color = 31 if i >= (columns * 0.75).to_i
        print colorize("|", color)
      end
      print " " * (columns - bars)
    end

    def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end

    def columns
      @columns ||= Whosup::Terminal.columns
    end

  end
end
