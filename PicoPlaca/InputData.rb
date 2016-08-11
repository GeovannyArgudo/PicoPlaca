class InputData
  attr_accessor :plate
  attr_accessor :date
  attr_accessor :time
  
  def initialize(plate = "AAA-0000", date = "01/01/2000", time = "00:00")
    if plate.is_a?(String)
      @plate = plate
    else
      @plate = "AAA-0000"
    end
    
    if date.is_a?(String)
      @date = date
    else
      @date = "01/01/2000"
    end
    
    if time.is_a?(String)
      @time = time
    else
      @time = "00:00"
    end
  end
end