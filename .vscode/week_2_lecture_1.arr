use context starter2024

#create a green triangle
green_triangle = triangle(35, 'solid', 'green')

#display the triangle
#green_triangle

num_a = 10
num_b = 16

#take sum of both numbers
total = num_a + num_b
#display the total
#total
product_a_b = num_a * num_b
#dispaly the product of a and b
#product_a_b

#create a orange triangle
orange_triangle = triangle(35, 'solid', 'orange')

#display the triangle 
#orange_triangle

#define side length and colour
side_length = 40
colour = "red"

#create a square with side_length and colour
red_square = square(side_length, "solid", colour)
radius = 20
height = 80
width = 30
circle_colour = "yellow"
rectangle_colour = "black"

yellow_circle = circle(radius, "solid", circle_colour)
black_rectangle = rectangle(height, width, "solid", rectangle_colour)

above(beside(yellow_circle, yellow_circle), black_rectangle)

red_rectangle = rectangle(70, 50, "solid", "red")
yellow_star = star(20, "solid", "yellow")
overlay(yellow_star, red_rectangle)