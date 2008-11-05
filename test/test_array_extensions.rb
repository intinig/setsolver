require 'test/unit'
require File.join(File.dirname(__FILE__), '../lib/array_extensions.rb')

class TestArrayExtensions < Test::Unit::TestCase
  def setup
    @long_array = [1,2,3,4,5,6,7,8,9,10,11,12]
    @short_array = [1,2,3]
  end
  
  def test_combinations_without_repetition_size
    assert_equal 220, @long_array.combinations_without_repetitions(3).size
  end
  
  def test_combinations_without_repetitions_for_small_arrays_size
    assert_equal 1, @short_array.combinations_without_repetitions(3).size
  end
  
  def test_combinations_without_repetitions_for_same_sizes
    assert_equal [[1,2,3]], @short_array.combinations_without_repetitions(3)
  end
  
  def test_combinations_without_repetitions_for_different_sizes
    assert_equal [[1,2], [1,3], [2,3]], @short_array.combinations_without_repetitions(2)
  end
  
  def test_should_give_fucked_up_array_for_k_one
    assert_equal [[1],[2],[3]], @short_array.combinations_without_repetitions(1)
  end
  
  def test_should_work_correctly_for_a_medium_array
    assert_equal [[1,2,3], [1,2,4], [1,3,4], [2,3,4]], [1,2,3,4].combinations_without_repetitions(3)
  end
  
end