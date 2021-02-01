pass = TRUE
print(class(pass))

a = 12.3
b = 150
print(class(a))

int = 2L
print(class(int))

ky_tu = 'a'
print(class(ky_tu))

x = c(12.5, 'Hello', TRUE, c(1, 2, 3))
print(class(x))

# Factor
apple_colors = c('green', 'green', 'yellow', 'red', 'red', 'red', 'green', 'white')
factor_apple = factor((apple_colors))
print(factor_apple)
print(nlevels(factor_apple))

# List
list1 = list(c(2, 5, 3), 21.3, 'spring')
print(list1)

# Matrix
M = matrix(c(1, 2, 3, 4, 5, 6, 7, 8),
           nrow = 2,
           ncol = 4,
           byrow = TRUE)
print(M)

M = matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3)
print(M)

# Array
a = array(c('red', 'green', 'yellow'), dim = c(3, 3, 2))
print(a)

# Dataframe
BMI = data.frame(
  gender = c('Male', 'Male', 'Female'),
  height = c(152, 171.5, 165),
  weight = c(81, 93, 78),
  age = c(42, 38, 26)
)
print(BMI)

print(ls())

# Arithmetic Operators
v = c(2, 5.5, 6)
t = c(8, 3, 4)

print(v + t)
print(v - t)
print(v * t)
print(v / t)
print(v %% t)
print(v %/% t)

# Relational Operators
print(v > t)
print(v < t)
print(v == t)
print(v >= t)
print(v <= t)
print(v != t)

# Logic Operators
v = c(3, 1, TRUE, 0)
t = c(4, 1, FALSE, 2)

print(v & t)
print(v | t)
print(!v)
print(!t)
print(v && t)
print(v || t)

# Miscellaneous Operators
v = 1:10
print(v)

v1 = 8
v2 = 12
v = c(2, 4, 3, 9, 11)
print(v1 %in% v)
print(v2 %in% v)

name = readline(prompt = "In put name")
age = as.integer(readline(prompt = "In put age: "))
height = as.numeric(readline(prompt = "In put height: "))

print(paste('Hi', name, 'next year you will be', age + 1, 'years old.'))

colors = c('red', 'green', 'blue')
cat('color are', colors, '\n')

# String
s1 = "This is first sentence."
s2 = 'This is second sentence.'
s3 = "This is 'third' sentence."
s4 = 'This is "fourth" sentence.'

print(s1)
print(s2)
print(s3)
print(s4)

# Parse
a = "one"
b = 'two'
c = "three"

print(paste(a, b, c))
print(paste(a, b, c, sep = "-"))
print(paste(a, b, c, sep = ""))

print(nchar(s1))

s = "This is a string"

# substring
s_sub = substring(s1, 5, 12)
print(s_sub)

print(chartr(" ", "-", s1))
print(toupper(s))
print(tolower(s))

# Chartr
print(chartr(" ", "-", s))

char_lst = strsplit(s1, " ")
word_lst = unlist(char_lst)
print(word_lst)

sorted_lst = sort(word_lst)
print(sorted_lst)

# Date
print(date())
print(Sys.Date())

d1= "02-11-2018"
print(d1)
print(as.Date(d1, format("%d-%m-%y")))

distance = Sys.Date() - as.Date("2018-01-01")
print(distance)

difftime(Sys.Date(), as.Date("2018-01-01"), units = "weeks")