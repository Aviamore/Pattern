# 1 Задание
#  Написать методы, которые находят минимальный, элементы, номер первого положительного элемента. Каждая
#  операция в отдельном методе. Решить задачу с помощью циклов(for и while).

# 2 Задание
#  Написать программу, которая принимает как аргумент два значения. Первое значение говорит, какой из методов задачи
#  1 выполнить, второй говорит о том, откуда читать список аргументом должен быть написан адрес файла. 
#  Далее необходимо прочитать массив и выполнить метод.

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


def vibirai(num, file) 
  mass = IO.read(file).split.map(&:to_i) 
  case num
    when "1"
      return min_element(mass)
    when "2"
      return f_pos_index(mass)
  end
end 

puts vibirai(ARGV[0], ARGV[1])
