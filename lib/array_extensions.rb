module ArrayExtensions
  def combinations_without_repetitions(k)
    combine(self, k)
  end
  
  private
  def combine(array, k)
    return [array] if k == array.size
    return array.collect {|e| [e]} if k == 1  
    results = []
    array[0..(array.size - k)].each_with_index do |val, idx|
      results += combine(array[(idx+1)..-1], k - 1).collect {|e| [val, e].flatten}
    end
    results
  end
end

Array.class_eval do
  include ArrayExtensions
end