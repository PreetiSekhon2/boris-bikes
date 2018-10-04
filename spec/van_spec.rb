require "./lib/van.rb"
require "garage.rb"

describe Van do

  it "fetches broken bikes from docking station" do
    dockingstation = DockingStation.new
    dockingstation.dock_defective_bike(Bike.new)
    expect(subject.fetch_broken_bikes(dockingstation)).to be_a(Array)
  end

  it "returns broken bikes to garage" do
    garage = Garage.new
    expect(subject.return_bikes_to_garage(garage)).to eq(true)
  end

end
