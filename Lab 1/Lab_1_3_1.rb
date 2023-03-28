# 1 Задание
#  Написать методы, которые находят минимальный, элементы, номер первого положительного элемента. Каждая
#  операция в отдельном методе. Решить задачу с помощью циклов(for и while).


def min_element(array)
  min = array[0]
  for num in array
    min = num if num < min
  end
  min
end

def f_pos_index(array)
  index = nil
  i = 0
  while i < array.length
    if array[i] > 0
      index = i
      break
    end
    i += 1
  end
  index
end