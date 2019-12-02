class FuelCounter
  def initialize
    file = File.open("input.txt")
    @file_data = file.readlines.map(&:chomp)
    file.close
    @fuel_required = 0
  end

  def calculate
    @file_data.each do |mass|
      @fuel_required += measure_total_mass(mass.to_i)
    end
    @fuel_required
  end

  def measure_total_mass(mass)
    new_mass = measure(mass)
    return 0 if new_mass <= 0
    new_mass + measure_total_mass(new_mass)
  end

  def measure(mass)
    (mass / 3).floor - 2
  end
end

fc = FuelCounter.new
puts fc.calculate
# 5178170