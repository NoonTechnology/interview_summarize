=begin
  在Ruby里，要读取，或是改变对象的属性，唯一的途径是调用对象的方法。
  控制了对方法的访问，也就控制了对对象属性的访问。
  控制对方法的访问，有三种方式：  
   访问控制                                          意义
  public       可以被任何实例对象调用，不存在访问控制；
  protected    可以被定义它的类和其子类访问，可以在类中或子类中指定给实例对象；
  private      可以被定义它的类和其子类访问，不能被实例对象调用。
  方法默认都是公有的（initialize方法除外，它永远是私有的）。
=end

class Person 
  def talk 
    puts "public :talk,将调用speak" 
    speak 
  end 

  protected
    def speak 
      laugh 
    end 

  private
    def laugh 
      puts "private:laugh" 
    end 
end 
p1=Person.new 
p1.talk 

#p1.speak  实例对象不能访问protected方法
#p1.laugh  实例对象不能访问private方法

puts "-----------------------------------------------------"

class Person 
  protected
    def speak 
      "protected:speak" 
    end 
  private
    def laugh 
      "private:laugh" 
    end 
end 

class Student < Person 
  def useLaugh 
    puts laugh 
  end 
  def useSpeak 
    puts speak 
  end 
end 

p2=Student.new 
p2.useLaugh  # => private:laugh
p2.useSpeak  # => protected:speak

puts "----------------------------------------------------"

class Person 
  protected
    def speak 
      "protected:speak " 
    end 

  private
    def laugh 
      "private:laugh" 
    end 

  def useLaugh(another) 
    puts another.laugh #这里错误，私有方法不能指定对象
  end 

  def useSpeak(another) 
    puts another.speak 
  end 
end 
p1=Person.new 
p2=Person.new 
p2.useSpeak(p1)  # =>  protected:speak

#p2.useLaugh(p1)

=begin
  从上面三个程序可以得出结论：
  public方法，可以被定义它的类和其子类访问，可以被类和子类的实例对
  象调用；
  protected方法，可以被定义它的类和其子类访问，不能被类和子类的实例
  对象直接调用，但是可以在类和子类中指定给实例对象；
  private方法，
  可以被定义它的类和其子类访问，私有方法不能指定对象。
=end
