require "Predictor"
require "test/unit"

class UnitTest < Test::Unit::TestCase
  
  def setup
    @p = Predictor.new()
    @i = InputData.new()
  end
  
  def test_predict_time
    
    @i.plate = "AAA-0001"
    @i.date = "15/08/2016"
    
    @i.time = "05:00"
    assert_equal(false, @p.predict(@i))
      
    @i.time = "08:30"
    assert_equal(true, @p.predict(@i))
    
    @i.time = "13:00"
    assert_equal(false, @p.predict(@i))
      
    @i.time = "17:30"
    assert_equal(true, @p.predict(@i))
    
    @i.time = "21:00"
    assert_equal(false, @p.predict(@i))
    
  end
  
  def test_predict_daysAndPlates
    @i.time = "08:00"
    
    @i.date = "15/08/2016"
    @i.plate = "AAA-0001"
    assert_equal(true, @p.predict(@i))
    @i.plate = "AAA-0005"
    assert_equal(false, @p.predict(@i))
    
    @i.date = "16/08/2016"
    @i.plate = "AAA-0003"
    assert_equal(true, @p.predict(@i))
    @i.plate = "AAA-0007"
    assert_equal(false, @p.predict(@i))
    
    @i.date = "17/08/2016"
    @i.plate = "AAA-0005"
    assert_equal(true, @p.predict(@i))
    @i.plate = "AAA-0009"
    assert_equal(false, @p.predict(@i))
    
    @i.date = "18/08/2016"
    @i.plate = "AAA-0007"
    assert_equal(true, @p.predict(@i))
    @i.plate = "AAA-0001"
    assert_equal(false, @p.predict(@i))
    
    @i.date = "19/08/2016"
    @i.plate = "AAA-0009"
    assert_equal(true, @p.predict(@i))
    @i.plate = "AAA-0003"
    assert_equal(false, @p.predict(@i))
      
    @i.plate = "AAA-0000"
    @i.date = "20/08/2016"
    assert_equal(false, @p.predict(@i))
    @i.date = "21/08/2016"
    assert_equal(false, @p.predict(@i))  
  end
end