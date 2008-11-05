class Card
  attr_accessor :color, :shape, :shading, :number
  
  COLORS  = ['Green', 'Red', 'Purple']
  SHAPES  = ['Oval(s)', 'Squiggle(s)', 'Diamond(s)']
  SHADING = ['Solid', 'Striped', 'Open']
  
  COLOR_CODES = {'g' => 0, 'r' => 1, 'p' => 2}
  SHAPE_CODES = {'o' => 0, 's' => 1, 'd' => 2}
  SHADING_CODES = {'s' => 0, 't' => 1, 'o' => 2}

  def initialize(options = {})
    @color = options[:color] || rand(3)
    @shape = options[:shape] || rand(3)
    @shading = options[:shading] || rand(3)
    @number = options[:number] || rand(3) + 1
  end
  
  def self.parse(string)
    self.new(:number => string[0,1].to_i, :shading => SHADING_CODES[string[1,1]], :color => COLOR_CODES[string[2,1]], :shape => SHAPE_CODES[string[3,1]] )
  end
  
  def describe
    "#{@number} #{SHADING[@shading]} #{COLORS[@color]} #{SHAPES[@shape]}"
  end
end