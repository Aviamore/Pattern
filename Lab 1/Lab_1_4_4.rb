# 44 Дан массив чисел. Необходимо проверить, чередуются ли в нем целые и вещественные числа.

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
