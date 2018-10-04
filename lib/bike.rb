class Bike

  def initialize
    @bike_condition = true
  end

  def working?
    return @bike_condition
  end

  def condition_to_defective
    @bike_condition = false
  end
end
