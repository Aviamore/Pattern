#Найти количество чисел, взаимно простых с заданным.
def nod(a, b)
  return a if b == 0
  nod(b, a % b)
end

def count_coprimes(n)
  count = 0
  (1..n-1).each do |i|
    count += 1 if nod(i, n) == 1
  end
  return count
end

n = gets.to_i # заданное число
puts "Количество чисел, взаимно простых с #{n}: #{count_coprimes(n)}"