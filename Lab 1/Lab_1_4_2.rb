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

puts find_missing_numbers(arr) # [1, 3, 5, 7, 10] = [2, 4, 6, 8, 9]