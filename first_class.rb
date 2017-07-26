require './module1'
require './module2'
require './origin_class'
class FirstClass < OriginClass
  include Module1
  include Module2
  
  def some_method
    puts "This is from class"
    super
  end

  def some_method
    puts "Tis is from second method in same class has same name"
    super
  end

  def module_method
    puts "This is from class"
    super
  end

end

first_obj = FirstClass.new
first_obj.some_method
first_obj.module_method
