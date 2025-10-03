use context starter2024

fun add-two-numbers(first-num, second-num):
  #computation
  first-num + second-num
end


add-two-numbers(5, 8)

add-two-numbers(2, 6)

add-two-numbers(4, 5)

fun welcome(name :: String) -> String:
  "Welcome to class, " + name
end

welcome("Caroline")

fun three-stripe-flag(top :: String, middle :: String, bot :: String) -> Image:
  doc: "returns a flag with three stripes"
  frame(
    above(rectangle(120, 30, "solid", top),
      above(rectangle(120, 30, "solid", middle),
        rectangle(120, 30, "solid", bot))))
end

three-stripe-flag("red", "white", "blue")
  
fun area(width :: Number, height :: Number) -> Number:
  width * height
end

fun tshirt-cost(message :: String, num-shirts :: Number) -> Number:
  doc: "returns the cost of 1-tshirt based on how many characters the message has"
  ((10 * string-length(message)) + 5) * num-shirts
end

tshirt-cost("Go Team!", 4)
tshirt-cost("Hello World", 7)

fun celsius-to-fahrenheit(temp-in-celsius :: Number) -> Exactnum:
  doc: "returns the temperature in fahrenheit"
  (temp-in-celsius * 9/5) + 32
end

celsius-to-fahrenheit(30)

fun fahrenheit-to-celsius(temp-in-fahrenheit :: Number) -> Exactnum:
  doc: "returns the temperature in celsius"
  (temp-in-fahrenheit - 32) * 5/9
end

fahrenheit-to-celsius(86)

check:
  celsius-to-fahrenheit(0) is 32
  fahrenheit-to-celsius(32) is 0
  celsius-to-fahrenheit(30) is 86
  fahrenheit-to-celsius(86) is 30
end

fun drawing(rectangle-color, star-color):
  one_rectangle = rectangle(70, 50, "solid", rectangle-color)
  two_star = star(20, "solid", star-color)
  overlay(two_star, one_rectangle)
end

drawing("red", "yellow")