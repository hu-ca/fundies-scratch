use context starter2024

data MobileRecord:
    phone(title :: String, model :: String, color :: String, storage :: Number)
end

phone-1 = phone('iPhone', '13 Pro', 'Blue', 64)
phone-2 = phone('iPhone', '17 Pro', 'Orange', 512)

phone-2.storage

fun check-storage(p :: MobileRecord) -> String:
  if (p.storage == 64):
    "Wow you have 64 GB of storage!"
  else if (p.storage == 512):
    "You have 512 GB of storage!"
  end
end

check-storage(phone-2)

fun compute-cost(p :: MobileRecord) -> Number:
  doc: "Computes phone cost based on storage capacity"
  base-price = 500
  price-per-gb = 2
  base-price + (p.storage * price-per-gb)
where:
  compute-cost(phone-1) is 628
  compute-cost(phone-2) is 1524
end



fun compute-cost-condition(p :: MobileRecord) -> Number:
  doc: "Compute phone cost based on storage, model, and color"

  #base price depends on model
  base-price = if p.model == "13 Pro":
    799
  else if p.model == "14 Pro":
    999
  else if p.model == "17 Pro":
    1399
  else:
    699
  end
  #storage
  storage-cost = if p.storage <= 64:
    0
  else if p.storage <= 128:
    100
  else if p.storage <= 256:
    200
  else if p.storage <= 512:
    400
  else:
    600
  end
  #color
  color-cost = if (p.color == "Orange") or (p.color == "Purple"):
    150
  else: 
    0
  end
  base-price + storage-cost + color-cost
where:
  compute-cost-condition(phone-1) is 799 + 0 + 0
  compute-cost-condition(phone-2) is 1399 + 400 + 150
end

data Priority:
  | low
  | medium
  | high
end

task-1-priority = low
task-2-priority = high
task-3-priority = medium

check:
  is-Priority(task-1-priority) is true
  is-low(task-1-priority) is true
  is-medium(task-3-priority) is true
  is-high(task-2-priority) is true
end

data Status:
  | todo
  | in-progress
  | done
end

data Task:
  | task(description :: String, priority :: Priority, status :: Status)
  | note(description :: String)
end

task-1 = task("Buy groceries", low, todo)
task-2 = task("Pay council tax", high, done)
note-1 = note("Post Office closes at 4:30")

fun describe(t :: Task) -> String:
  cases (Task) t:
    | task(d, p, s) =>
      priority = cases (Priority) p:
        | low => "❕TASK: "
        | medium => "❗️TASK: "
        | high => "‼️ TASK: "
      end
      status = cases (Status) s: 
        | todo => " TODO"
        | in-progress => " IN-PROGRESS"
        | done => " DONE"
      end
      priority + d + status
    | note(d) => "📝 " + d
  end
end

describe(task-1)
describe(task-2)
describe(note-1)

data Temperature:
  | celcius(degrees :: Number)
  | fahrenheit(degrees :: Number)
  | kelvin(degrees :: Number)
end

temp-1 = fahrenheit(50)
temp-2 = kelvin(300)


fun to-celcius(temp :: Temperature) -> Number:
  if temp == fahrenheit:
    (5/9) * (temp.degrees - 32)
  else if temp == kelvin:
    temp.degrees - 273.15
  else:
    temp.degrees
  end
where:
  to-celcius(temp-1) is 50
  to-celcius(temp-2) is 300
end
