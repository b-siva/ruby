class InstMethod
  def initialize
    @hello = "Hello world"
  end

  def one_variable
    @onevariable = "one variable"
  end

  def access_variable
    puts @hello.inspect
  end

  def access_another_one
    puts @onevariable.inspect
  end

  def access_it
    one_variable
    puts @onevariable.inspect
  end

end

i = InstMethod.new
puts "access_variable"
puts "-------------"
puts i.access_variable
puts "--------------"
puts "access_another_one"
puts "-------------------"
puts i.access_another_one
puts "-----------------"
puts "access_it"
puts "-------------"
puts i.access_it
puts "--------------"
puts "access_another_one"
puts "-------------------"
puts i.access_another_one
