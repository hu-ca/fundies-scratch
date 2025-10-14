use context starter2024

fun kilo-to-mi(n :: Number) -> Number:
  doc: "converts kilometers to miles"
  n / 1.6
where:
  kilo-to-mi(1.6) is 1
  kilo-to-mi(6.4) is 4
end

fun air-quality(aqi :: Number) -> String:
  doc: ""
  if (aqi > 0) and (aqi <= 50):
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



