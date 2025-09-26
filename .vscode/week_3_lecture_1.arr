use context starter2024

fun choose-hat(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below nothing"
  ask:
    | temp-in-C > 27 then: "Sun hat"
    | temp-in-C < 10 then: "Winter hat"
    | otherwise: "No hat"
  end #to end the if condition
  
end # to end the function

#function call
choose-hat(29)
choose-hat(9)

fun add-glasses(outfit :: String) -> String:
  doc: "adds glasses to outfit"
  outfit + ", and glasses"
end

add-glasses("T-shirt, jeans")
add-glasses("Sweater, shorts")

fun choose-outfit(temp-in-C :: Number) -> String:
  doc: "uses functions choose-hat and add-glasses to create an outfit based on temperature."
  block: 
    add-glasses(choose-hat(temp-in-C))
  end
end

choose-outfit(25)
choose-outfit(9)

fun choose-hat-or-visor(temp-in-C :: Number, has-visor :: Boolean) -> String:
  doc: "chooses hat or visor based on temperature and boolean has-visor"
  block:
    if (temp-in-C > 30) and (has-visor == true):
      "Wear visor"
    else:
      "Wear hat"
    end
  end
end

choose-hat-or-visor(45, true)
choose-hat-or-visor(20, true)