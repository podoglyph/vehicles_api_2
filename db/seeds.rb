class Seed

  def self.seed_me
    create_makes
    create_models
    create_options
    create_vehicles
    create_vehicle_options
  end

  def self.create_makes
    countries = %w(America Japan Germany Mexico Sweeden Britain China)
    10.times do
      make = Make.create!(name: Faker::Vehicle.manufacture, country: countries.sample)
      puts "Created Make: #{make.name} from #{make.country}."
    end
  end

  def self.create_models
    makes = Make.all
    base_prices = [10999, 12999, 14999, 18999, 19999, 24999, 29999, 34999, 44999, 59999]
    styles = %w(sedan pickup suv)
    makes.each do |make|
      3.times do
        model = make.models.create!(name: Faker::StarWars.unique.vehicle, base_price: base_prices.sample, style: styles.sample )
        puts ("Created Model: #{make.name} #{model.name}.")
      end
    end
  end

  def self.create_options
    options_list.each do |o|
      option = Option.create!(name: o, cost: Faker::Number.number(3))
      puts "Created Option: #{option.name}."
    end
  end

  def self.create_vehicles
    nicknames.each do |n|
      vehicle = Vehicle.create!(nickname: n, color: Faker::Color.color_name, mileage: Faker::Number.between(25, 150000))
      puts "Created #{vehicle.nickname}."
    end
  end

  def self.create_vehicle_options
    options = Option.all
    vehicles = Vehicle.all
    vehicles.each do |vehicle|
      vehicle.options << options.sample(5)
      puts "Added Options to #{vehicle.nickname}"
    end
  end

  def self.options_list
    ["CD Changer/stacker", "4 Wheel drive", "Air Conditioning", "Aluminum/Alloy Wheels", "Automatic Transmission", "Bed Liner", "Captains chairs - 2nd row", "Cruise Control", "Dual Air Conditioning", "Dual Power Seats", "Rear DVD/TV", "Hard Top (convertible)", "Heated Seats", "Leather Seats", "Luggage / Roof Rack", "Specialty Stereo System", "Soft Top (convertible)", "Manual Transmission", "Navigation", "Power Door Locks", "Power Seat (Drivers)", "Power Steering", "Power Sunroof", "Power Windows", "Running Boards", "Satellite Radio", "Snow / Plow Package", "Remote Starter", "Theft Deterrent / Alarm", "Theft Recovery System", "Third Row Seats", "Tilt Wheel", "Tonneau Cover / Bed Cover", "Towing / Trailer Package", "Turbo Diesel", "Hybrid", "Chrome wheels 20 inch"]
  end

  def self.nicknames
    ["Demon", "Bolt", "Kazam", "Devil", "Knockout", "Boom Boom", "Dust Devil", "TO", "Bam Bam", "Dam Hoover", "Burner", "Roadrunner", "Taz", "Burn", "Fast Five", "Smoke", "Racer", "Fast and Furious", "Brimstone", "Race", "Furiosa", "Firebrand", "Fast", "Imperator Furiosa", "Torch", "SpeedX", "Hannibal", "Torcher", "Pacer", "Clockwork", "Scorch", "Pace", "Clockwork Orange", "Light wave", "Divebomb", "Dr. Strangeglove"]
  end

end


Seed.seed_me
