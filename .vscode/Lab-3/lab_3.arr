use context starter2024

fun leap-year(year :: Number) -> Boolean:
  doc: "checks if given year is a leap year by checking when divided by 4, the remainder is 0"
  ask:
    |num-modulo(year, 4) == 0 then: true
    |otherwise: false
  end
where: 
  leap-year(2020) is true
  leap-year(2024) is true
  leap-year(2025) is false
end

fun tick(second :: Number) -> Number:
  doc: "returns the next second"
  if (second >= 0) and (second <= 59):
    if second == 59:
      0
    else:
      second + 1
    end
  else:
    0
  end
where: 
  tick(1) is 2
  tick(59) is 0
  tick(0) is 1
end
    
fun rock-paper-scissors(input-1 :: String, input-2 :: String) -> String:
  doc: ""
  if (input-1 == "rock") and (input-2 == "scissors"):
    "player 1"
  else if (input-1 == "rock") and (input-2 == "paper"):
    "player 2"
  else if (input-1 == "paper") and (input-2 == "rock"):
    "player 1"
  else if (input-1 == "paper") and (input-2 == "scissors"):
    "player 2"
  else if (input-1 == "scissors") and (input-2 == "rock"):
    "player 2"
  else if input-1 == input-2:
    "tie"
  else:
    "invalid choice"
  end
where:
  rock-paper-scissors("rock", "scissors") is "player 1"
  rock-paper-scissors("rock", "paper") is "player 2"
  rock-paper-scissors("paper", "rock") is "player 1"
  rock-paper-scissors("paper", "scissors") is "player 2"
  rock-paper-scissors("rock", "rock") is "tie"
  rock-paper-scissors("hello", "scissors") is "invalid choice"
end

    
      
