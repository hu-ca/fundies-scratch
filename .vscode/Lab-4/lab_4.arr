use context dcic2024
include csv
include data-source

flights = load-table:
  rownames,
  dep-time,
  sched-dep-time,
  dep-delay,
  arr-time,
  sched-arr-time,
  arr-delay,
  carrier,
  flight,
  tailnum,
  origin,
  dest,
  air-time,
  distance,
  hour, 
  minute,
  time_hour
  source: csv-table-file("flights.csv", default-options)
end

fun is-long-flight(r :: Row) -> Boolean:
  doc: "checks if flight's distance is greater than or equal to 1500"
  r["distance"] >= 1500
end

filter-with(flights, lam(o): o["distance"] >= "1500" end)
order-by(flights, "air-time", false)

first-row = flights.row-n(0)

first-row["carrier"]
first-row["origin"]
first-row["dest"]

fun is-delayed-departure(r :: Row):
  doc: "checks if flight's departure delay is greater than or equal to 30"
  r["dep-delay"] >= 30
end

fun is-morning-sched-dep(r :: Row):
  r["sched-dep-time"] < 1200
end

filtered-flights = filter-with(filter-with(flights, lam(o): o["dep-delay"] >= "30" end), lam(o): o["sched-dep-time"] < "1200" end)

flights-two = filter-with(filtered-flights, lam(o): o["distance"] > "500" end)

order-by(flights-two, "dep-delay", false)

worst-flight = flights-two.row-n(0)

worst-flight["flight"]
worst-flight["origin"]
worst-flight["dep-delay"]

#fun change-to-0(o :: Number) -> Number:
#doc: ""
#if o["dep-delay"] < 0: 
  # o["dep-delay"] = 0
  # else:
    
  #end
#end

transform-column(flights, "dep-delay", lam(o): 
  if o < 0: 
  0
  else: 
  o 
  end 
  end)