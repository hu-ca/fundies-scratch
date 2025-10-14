use context dcic2024

include csv
include data-source

flights_53 = 
  load-table: rownames, dep_time, sched_dep_time, dep_delay, arr_time, sched_arr_time, arr_delay, carrier, flight, tailnum, origin, dest, air_time, distance, hour, minute, time_hour
    source: csv-table-file("flights_sample53.csv", default-options)
    sanitize rownames using num-sanitizer
    sanitize sched_dep_time using num-sanitizer
    sanitize dep_delay using num-sanitizer
    sanitize arr_time using num-sanitizer
    sanitize sched_arr_time using num-sanitizer
    sanitize arr_delay using num-sanitizer
    sanitize flight using num-sanitizer
    sanitize air_time using num-sanitizer
    sanitize distance using num-sanitizer
    sanitize hour using num-sanitizer
    sanitize minute using num-sanitizer
  end

flights_53

#ew-flights = transform-column(flights_53, "tailnum", lam(o): if o == "": string-replace(o, "", "UNKNOWN") end) 
  
new-flights = transform-column(flights_53, "tailnum", lam(o): 
    if o == "": "UNKNOWN" else: o end
end)
new-flights

flights-2 = transform-column(flights_53, "dep_delay", lam(o):
  if o < 0: 0 else: o end end)

flights-3 = transform-column(flights-2, "arr_delay", lam(o): if o < 0: 0 else: 0 end end)

flights-3

flights-4 = transform-column(flights-3, "flight", lam(o): num-to-string(o) end)

flights-4

fun trim(s :: String) -> String:
  doc: "Remove spaces from the given string"
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s, " ", "")
  end
end

flights-5 = transform-column(flights-4, "carrier", lam(o): trim(o) end)

flights-5

fun check-length(s :: String) -> String:
  if string-length(s) < 4:
    "0" + s
  else:
    s
  end
end

flights-6 = transform-column(flights-5, "dep_time", lam(o): check-length(o) end)

flights-6

fun separate-times(s :: String) -> String:
  hour = string-substring(s, 0, 2)
  min = string-substring(s, 2, string-length(s))
  hour + ":" + min
end

flights-7 = transform-column(flights-6, "dep_time", lam(o): separate-times(o) end)

flights-7

#build-column(flights-7, dedup-key, lam(o): "flight" + "

fun max-distance-flown(Numbers :: List<Number>):
  block: 
    var elem = 0
    for each(n from Numbers):
      block:
      if elem < n:
        elem := n
      else:
        elem
      end 
      elem
    end
  end
  end
where:
  max-distance-flown([list: 1, 2, 3]) is 3
end

list-2 = [list: 1, 2, 3]

#max-distance-flown()