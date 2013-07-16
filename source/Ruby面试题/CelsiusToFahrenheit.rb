puts "Please select "
puts 'A for Celsius to Fahrenheit'
puts 'B for Fahrenheit to Celsius'
STDOUT.flush  
string0 = gets.chomp  
if string0.downcase == 'a'
  puts 'Enter the temperature in Celsuis'
  STDOUT.flush
  string1 = gets.chomp
  x = string1.to_f
  y = 32+(9.0/5)*x
  puts 'The temperature in Fahrenheit is '+y.to_s
else
  if string0.downcase == 'b'
    puts 'Enter the temperature in Fahrenheit'
    STDOUT.flush
    string2 = gets.chomp
    x = string2.to_f
    y = (x-32)*(5.0/9)
    puts 'The temperature in Celsius is '+y.to_s
  else
    puts 'Invalid option.'
  end
end
