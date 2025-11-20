use context starter2024

include csv
include data-source

penguins =
  load-table: number, species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year
  source: csv-table-file("penguins.csv", default-options)
    sanitize bill_length_mm using num-sanitizer
    sanitize bill_depth_mm using num-sanitizer
    sanitize flipper_length_mm using num-sanitizer
    sanitize body_mass_g using num-sanitizer
    sanitize year using num-sanitizer
end

penguins

# Scalar Processing Example:
# Question: Does this penguin row represent a male penguin?

fun is-male(r :: Row) -> Number:
  if r["sex"] == "male":
    1
  else:
    0
  end
where:
  is-male(penguins.row-n(0)) is 1
end

#transformation
fun body-mass-to-category(r :: Row) -> List<String>:
  doc: ""
  category_list = [list: ]
  if ( > 0) and (aqi <= 50):
    "Good"
  else if (aqi >= 51) and (aqi <= 100):
    "Moderate"
  else if (aqi >= 101) and (aqi <= 150):
    "Unhealthy"
  else:
    "Hazardous"
  end
where: 
  air-quality(3) is "Good"
  air-quality(55) is "Moderate"
  air-quality(105) is "Unhealthy"
  air-quality(160) is "Hazardous"
end
  