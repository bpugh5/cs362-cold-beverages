require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'exists' do
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
  end

  it 'can dispense water' do
    water_reservoir = WaterReservoir.new(10, 10)
    vessel = Vessel.new('FAKE', 5)
    water_dispenser = WaterDispenser.new(water_reservoir)

    water_dispenser.dispense(vessel)
    expect(water_dispenser.reservoir.current_water_volume).to eq(5)
  end

  it 'fills the vessel after dispensing' do
    water_reservoir = WaterReservoir.new(10, 10)
    vessel = Vessel.new('FAKE', 5)
    water_dispenser = WaterDispenser.new(water_reservoir)

    water_dispenser.dispense(vessel)
    expect(vessel.current_water_volume).to eq(5)
  end

  it 'will fill the vessel with whatever it has left' do
    water_reservoir = WaterReservoir.new(10, 3)
    vessel = Vessel.new('FAKE', 5)
    water_dispenser = WaterDispenser.new(water_reservoir)

    water_dispenser.dispense(vessel)

    expect(vessel.current_water_volume).to eq(3)
  end
  
end
