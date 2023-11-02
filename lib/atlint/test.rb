module Atlint
  class Test
    def initialize
      puts "I'm here"
    end

    def meth
      x = 2
      y = 10
      z = x * y
      z **= 2

      z
    end
  end
end
