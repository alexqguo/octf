module AthletesHelper
  
  def format(mark)
    if Athlete::FIELD_EVENTS.include?(mark.event_name)
      mark.mark.to_s + "m"
    elsif Athlete::MULTI_EVENTS.include?(mark.event_name)
      mark.mark.to_i.to_s
    else
      to_hms(mark.mark)
    end
  end
  
  def to_hms(float)
    return float.to_s if float < 60
  
    string = ""

    hours = float >= 3600 ? (float.to_i / 3600).to_s : ""
    minutes = float > 60 ? ((float.to_i % 3600) / 60).to_s : ""
    seconds = (float % 60).round(2).to_s
  
    minutes = "0" + minutes if minutes.length < 2 && hours != ""
    seconds = format_secs(seconds)
  
    if hours == ""
      "#{minutes}:#{seconds}"
    else
      "#{hours}:#{minutes}:#{seconds}"
    end
  end

  def format_secs(seconds)
    arr = seconds.split(".")
  
    arr[0] = "0" + arr[0] if arr[0].length < 2
    arr[1] = arr[1] + "0" if arr[1].length < 2
  
    arr.join(".")
  end
  
end
