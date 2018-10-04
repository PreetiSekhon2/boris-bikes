class Van
  @defectivebikes
  def fetch_broken_bikes(dockingstation)
    @defectivebikes = dockingstation.return_defective_bikes
  end

  def return_bikes_to_garage(garage)
    garage.broken_bikes(@defectivebikes)
    @defectivebikes = Array.new
    return true
  end

end
