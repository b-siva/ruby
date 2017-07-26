require './car_m'
class Car
  include CarM
  def save_me
    puts "from first save_me"
  end

  def save_me
    puts "going to call super"
    super
    CarM.save_me
    puts "from second save_me"
  end

end


class MyCar
  include MyCarM
end

MyCar.new.hello
MyCar.hi

Car.new.save_me
puts "Call inner class"
Car::MyClass.new.save_me
puts Car.constants.inspect
Car::MyClass.save_me
