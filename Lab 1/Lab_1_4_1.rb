# 8 Дан целочисленный массив. Необходимо найти индексы двух наименьших элементов массива.


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
puts find_two_smallest_indexes(arr)

