def find_two_smallest_indexes(arr)
  smallest_index = arr.index(arr.min)
  arr.delete_at(smallest_index)
  second_smallest_index = arr.index(arr.min)
  second_smallest_index += 1 if second_smallest_index >= smallest_index
  [smallest_index, second_smallest_index]

end

n = gets.chomp.to_i
arr = []
n.times do |i|
  puts "Введите #{i+1}-й элемент массива:"
  arr << gets.chomp.to_i
end

def find_missing_numbers(arr)
  # Находим минимальное и максимальное значения в массиве
  min_value = arr.min
  max_value = arr.max

  # Создаем новый массив, заполняя его всеми целыми числами от минимального до максимального
  full_arr = (min_value..max_value).to_a

  # Используем оператор "-" для вычитания массива arr из полного массива full_arr,
  # чтобы найти все пропущенные числа
  missing_numbers = full_arr - arr

  missing_numbers
end

n = gets.chomp.to_i
arr = []
n.times do |i|
  puts "Введите #{i+1}-й элемент массива:"
  arr << gets.chomp.to_i
end

def count_local_maximals(arr)
  arr.each_cons(3).count { |a, b, c| b > a && b > c }
end

n = gets.chomp.to_i
arr = []
n.times do |i|
  puts "Введите #{i+1}-й элемент массива:"
  arr << gets.chomp.to_i
end

def alternating_integers_and_floats?(arr)
  integers = arr.select { |n| n.is_a?(Integer) }
  floats = arr.select { |n| n.is_a?(Float) }
  alternating = integers.zip(floats).flatten.compact
  alternating == arr
end

arr1 = [1, 2.5, 3, 4.5, 5]
arr2 = [1, 2, 3, 4.5, 5]
puts alternating_integers_and_floats?(arr1) # true
puts alternating_integers_and_floats?(arr2) # false

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

def select_method(num_method, file_name)
  a=0
  b=10
  array = IO.read(file_name).split.map(&:to_i)
  case num_method
    when "1"
      return find_two_smallest_indexes(arr)
    when "2"
      return find_missing_numbers(arr)
    when "3"
      return count_local_maximals(arr)
    when "4" 
      return alternating_integers_and_floats?(arr)
    when "5" 
      return arithmetic_mean(arr)
  end
end

puts select_method(ARGV[0], ARGV[1])