class HelloWorld
    
  def initialize(name)
    @name = name
  end
  
  def greeting
    puts "Welcome #{@name} to simple ruby program..."
  end
        
end

hello_world = HelloWorld.new('Mr John')
hello_world.greeting
