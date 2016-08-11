require "InputData"
require 'time'
class Predictor

  LOW_TIME_EARLY = 7*60 + 0
  HIGH_TIME_EARLY = 9*60 + 30
  LOW_TIME_LATE = 16*60 + 0
  HIGH_TIME_LATE = 19*60 + 30
  
  def predict(input)
    if input.is_a?(InputData)
        lastDigit = input.plate[-1,1]
        fullTime = Time.parse(input.date + " " + input.time)
        minsOfDay = fullTime.hour*60 + fullTime.min
        isRestricted = false
        
        if (minsOfDay > LOW_TIME_EARLY and minsOfDay < HIGH_TIME_EARLY) or 
           (minsOfDay > LOW_TIME_LATE and minsOfDay < HIGH_TIME_LATE)
           case fullTime.wday
           when 1
             if lastDigit == "1" or lastDigit == "2"
                isRestricted = true
             end
           when 2
             if lastDigit == "3" or lastDigit == "4"
               isRestricted = true
             end
           when 3
             if lastDigit == "5" or lastDigit == "6"
               isRestricted = true
             end
           when 4
             if lastDigit == "7" or lastDigit == "8"
               isRestricted = true
             end
           when 5 
             if lastDigit == "9" or lastDigit == "0"
               isRestricted = true
             end
           else
             isRestricted = false
           end
        else
          isRestricted = false
        end
        
        isRestricted
    end
  end
  
end