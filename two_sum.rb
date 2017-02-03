def bad_two_sum?(arr, target)
  (0..(arr.length - 2)).each do |i|
    ((i + 1)..arr.length - 1).each do |j|
      return true if (arr[i] + arr[j]) == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target)
  sorted_arr = arr.sort
  sorted_arr.each_with_index do |el, i|
    return true unless binary_search(sorted_arr[(i + 1).. -1], target - el).nil?
  end
  false
end

def binary_search(arr, target)
  return nil if arr.empty?
  mid = arr.length / 2
  case arr[mid] <=> target
  when 0
    return true
  when 1
    binary_search(arr.take(mid), target)
  else
    right = binary_search(arr.drop(mid + 1), target)
    right.nil? ? nil : mid + 1 + right
  end
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false
arr = [0, 1, 5, 7]

def hash_two_sum?(arr, target)
  hash = Hash.new
  arr.each do |el|
    hash[el] = true unless el == target / 2.0
  end

  hash.each do |k, v|
    return true unless hash[target - k].nil?
  end

  false
end

p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false
# empty hash
# iterate over array
  # check if hash contains comple
  # set key value pairs
