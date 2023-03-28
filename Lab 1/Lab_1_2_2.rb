#Найти сумму цифр числа, делящихся на 3

def delitel(number)
sum = 0
number.to_s.chars.each do |digit|
  digit = digit.to_i
  sum += digit if digit % 3 == 0
return sum
end

number = gets.to_i

puts "Сумма цифр числа #{delitel(sum)}"
