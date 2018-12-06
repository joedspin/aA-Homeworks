
require 'byebug'



def bubble_sort!(array)
    # Bubble Sort: O(n^2)
    len = array.length - 1
    sorted = false

    until sorted
        sorted = true
        (0...len).each do |idx|
            if array[idx] > array[idx + 1]
            array[idx], array[idx + 1] = array[idx + 1], array[idx]
            sorted = false
            end
        end
        end

    array
  end

  def run_octopus_tests
    arr_fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    bubble_sort!(arr_fish)
  end