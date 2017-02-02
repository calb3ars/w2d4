list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# def my_min(list)
#   i = 0
#   while i < list.length
#     if list.any?{|el| el < list[i]}
#       i += 1
#     else
#       return list[i]
#     end
#   end
# end

def my_min(list)
  smallest = list[0]
  list.each do |el|
    if el < smallest
      smallest = el
    end
  end
  smallest
end


# p my_min(list)

 array = [5, 3, -7]
 array2 = [-5, -1, -3]

def sub_sum(array)
  subarrays = []

  (array.length).downto(1) do |i|
    array.each_cons(i) do |subarray|
      subarrays << subarray
    end
  end

  max_arr = subarrays[0]
  max = max_arr.inject { |res, el| res + el}
  subarrays.each do |sub_arr|
    if sub_arr.inject { |res, el| res + el} > max
      max_arr = sub_arr
      max = sub_arr.inject { |res, el| res + el}
    end
  end
  max
end

# p sub_sum(array2)
list2 = [2, 3, -6, 7, -6, 7]
list3 = array2
def faster_sum(arr)
  # max_arr = [arr.first]
  max_sum = 0
  sum = 0
  largest_num = arr[0]
  arr.each_with_index do |el , i|
    sum += el if el > 0

    largest_num = el if el > largest_num

    if el < 0
      max_sum = sum if sum > max_sum
      sum = 0
    end

  end

  max_sum == 0 ? largest_num : max_sum
end

p faster_sum(array)
p faster_sum(list2)
p faster_sum(list3)
