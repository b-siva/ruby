module CarM
  def save_me
    puts "from module"
  end

  def self.save_me
    puts "from module self method"
  end

  class MyClass
    def save_me
      puts "I am from MyClass"
    end
  end
end

module MyCarM
  def self.included(base)
    base.extend ClassMethods
  end

  def hello
   puts 'I am from MyCarM module - hello'
  end

  module ClassMethods
    def hi
      puts "hi - I will be available as class method to included base class"
    end
  end
end
