#32 Дан целочисленный массив. Найти количество его локальных максимумов.

def count_local_maximals(arr)
  arr.each_cons(3).count { |a, b, c| b > a && b > c }
end

n = gets.chomp.to_i
arr = []
n.times do |i|
  puts "Введите #{i+1}-й элемент массива:"
  arr << gets.chomp.to_i
end
puts count_local_maximals(arr) # [1, 2, 1, 5, 3, 2, 8] = 2
