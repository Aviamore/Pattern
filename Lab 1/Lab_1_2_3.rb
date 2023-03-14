#Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа.

def nod(a, b)
  return a if b == 0
  nod(b, a % b)
end

def find_divisor(number)
  max_count = 0
  result = nil

  (1..number/2).each do |divisor|
    if nod(divisor, number) == 1
      count = divisor.to_s.size
      if count > max_count
        max_count = count
        result = divisor
      end
    end
  end

  return result
end

print "Введите число: "
number = gets.to_i

divisor = find_divisor(number)

if divisor.nil?
  puts "У числа #{number} нет взаимно простых делителей"
else
  puts "Делитель числа #{number}, являющийся взаимно простым с наибольшим количеством цифр: #{divisor}"
end