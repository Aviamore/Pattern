# 56 Для введенного списка посчитать среднее арифметическое непростых элементов, которые больше, чем среднее арифметическое простых.

def is_prime?(n)
  return false if n <= 1
  (2..Math.sqrt(n)).none? { |i| n % i == 0 }
end

def arithmetic_mean(arr)
  primes = arr.select { |n| is_prime?(n) }
  primes_mean = primes.reduce(:+) / primes.size.to_f
  greater_than_primes_mean = arr.select { |n| !is_prime?(n) && n > primes_mean }
  greater_than_primes_mean.reduce(:+) / greater_than_primes_mean.size.to_f
end

n = gets.chomp.to_i
arr = []
n.times do |i|
  puts "Введите #{i+1}-й элемент массива:"
  arr << gets.chomp.to_i
end

puts arithmetic_mean(arr) # 7.7
