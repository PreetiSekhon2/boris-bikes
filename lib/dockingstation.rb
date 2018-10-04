require "./lib/bike.rb"

class DockingStation
  MAXSIZE= 20
  attr_accessor :sizeofthisstation
  def initialize (max = MAXSIZE)
    @sizeofthisstation = max
    @bikes_in_station = []
  end

  def release_bike
    #raise "No bike available" unless @bikes_in_station.length > 0
    raise "No bike available" if empty?
    @bikes_in_station.pop
  end

  def dock(bike)
    #raise "Unable to dock bike" unless @bikes_in_station.length < @max_size
    raise "Station full: Unable to dock bike" if full?
    @bikes_in_station << bike
    return "Bike docked"
  end

  def dock_defective_bike(bike)
    raise "Station full: Unable to dock bike" if full?
    bike.condition_to_defective
    @bikes_in_station << bike
    return "Defective bike docked"
  end

  def return_defective_bikes
    defective_bikes = []
    @bikes_in_station.length.times do |x|
      if @bikes_in_station[x].working? == false
        defective_bikes.push (@bikes_in_station.delete_at(x))
      end
    end
    return defective_bikes
  end

  def full?
    if @bikes_in_station.length == @sizeofthisstation
      return true
    else
      return false
    end
  end

  def empty?
    if @bikes_in_station.length == 0
      return true
    else
      @bikes_in_station.each do |bike|
        if bike.working?
          return false
        end
      end
    end
    return true
  end

  private :full?, :empty?

end
