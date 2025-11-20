use context starter2024

data SensorNet:
  | hub(bandwidth :: Number, left :: SensorNet, right :: SensorNet)
  | sensor(rate :: Number)
end

# Example network
sA = sensor(60)
sB = sensor(120)
sC = sensor(45)

# You can construct larger networks like:
hub1 = hub(150, sA, sB)
core = hub(200, hub1, sC)

fun total-load(n :: SensorNet) -> Number:
  doc: "calculates the total rate in a network"
  cases (SensorNet) n:
    | hub(bandwith, left, right) => total-load(left) + total-load(right)
    | sensor(rate) => rate
  end
where:
  total-load(sA) is 60
  total-load(hub1) is 180
  total-load(core) is 225
end

fun fits-capacities(n :: SensorNet) -> Boolean:
  doc: "checks if bandwidth is greater than the total load in a network"
  cases (SensorNet) n:
    | hub(bandwidth, left, right) => bandwidth >= total-load(n)
    | sensor(rate) => false
  end
where:
  fits-capacities(hub1) is false
  fits-capacities(sA) is false
  fits-capacities(hub(500, sB, sC)) is true
end

fun deepest-depth(n :: SensorNet) -> Number:
  doc: "counts how many jumps there are"
  cases (SensorNet) n:
    | hub(bandwidth, left, right) => 1 + deepest-depth(left) + deepest-depth(right)
    | sensor(rate) => 0
  end
where:
  deepest-depth(core) is 2
  deepest-depth(hub1) is 1
end
  
fun apply-scale(n :: SensorNet, s :: Number) -> SensorNet:
  doc: "applies a given scaling factor to each rate"
  cases (SensorNet) n:
    | hub(bandwidth, left, right) => hub(bandwidth, apply-scale(left, s), apply-scale(right, s))
    | sensor(rate) => sensor(rate / s)
  end
where:
  apply-scale(hub1, 1.2) is hub(150, sensor(50), sensor(100))
  apply-scale(sA, 3) is sensor(20)
end

fun needed-scale(n :: SensorNet) -> Number:
  doc: "computes the minimum scaling factor"
  cases (SensorNet) n:
    | sensor(rate)  => 1
    | hub(bw, l, r) =>
      block:
        load = total-load(l) + total-load(r)
        here = load / bw
        num-max( num-max(here, needed-scale(l)), needed-scale(r) )
      end
  end
where:
  # For 'core': max(225/200 = 1.125, hub1: 180/150 = 1.2) = 1.2
  needed-scale(core) is 1.2
end

fun scale-to-fit(n :: SensorNet) -> SensorNet:
  doc: "checks if network is feasible based on scaling it just enough"
  cases(SensorNet) n:
    | hub(bandwidth, left, right) =>
      block:
        s = needed-scale(n)
        if s <= 1:
          n
        else:
          apply-scale(n, s)
        end
      end
    | sensor(rate) => n
  end
where:
  fits-capacities(scale-to-fit(core)) is true
  total-load(scale-to-fit(core)) is total-load(core) / needed-scale(core)
end