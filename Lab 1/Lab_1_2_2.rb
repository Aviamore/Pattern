#Найти сумму цифр числа, делящихся на 3

number = gets.to_i

sum = 0
number.to_s.chars.each do |digit|
  digit = digit.to_i
  sum += digit if digit % 3 == 0
end

puts "Сумма цифр числа #{number}, делящихся на 3: #{sum}"