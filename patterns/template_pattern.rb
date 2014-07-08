class HR
  def hire
    phone_interview
    onsite_interview
    follow_up
  end

  def phone_interview
  end

  def onsite_interview
  end

  def follow_up
  end
end

class TechHR < HR
  def phone_interview
    puts 'do this'
  end

  def onsite_interview
    puts 'do this'
  end

  def follow_up
    puts 'do this'
  end
end


class MarketingHR < HR
  def phone_interview
    puts 'do that'
  end

  def onsite_interview
    puts 'do that'
  end

  def follow_up
    puts 'do that'
  end
end

tech_hr = TechHR.new
tech_hr.hire

marketing_hr = MarketingHR.new
marketing_hr.hire
