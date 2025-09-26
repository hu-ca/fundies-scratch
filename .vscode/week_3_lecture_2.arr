use context dcic2024
include csv
include data-source

workouts = table: date :: String, activity :: String, duration :: Number
  row: "2025-04-01", "Running", 30
  row: "2025-04-02", "Yoga", 45
  row: "2025-04-03", "Cycling", 60
end


second-workout = workouts.row-n(1)

#second-workout["activity"]

recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end


#lr-plot(recipes, "servings", "prep-time")

plants = load-table:
  plant-common-name :: String,
  location-latitude :: Number,
  location-longitude :: Number,
  date-sighted :: Number,
  soil-type :: String,
  plant-height-cm :: Number,
  plant-color :: String
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)
end

plants.length()
plants.row-n(101)