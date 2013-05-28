set term epslatex monochrome

set yrange [-0.02:1.0]
set xrange [-0.02:1.0]
set xtics 0, 1
set ytics 0, 1
set xlabel "$\\omega$" offset 0, 1.5
set key off
set size square 0.45, 0.45
set style arrow 1 head filled lt 5 lw 2

set output "ganancia1.tex"
set label "$1 - \\omega$" at -0.7, 0.6

set arrow from -0.25, 0.5 to 0.2, 0.5 as 1

plot 1 - x with lines lt -1 lw 2

unset label
unset arrow
set output "ganancia2.tex"
set label "$1 - \\omega^2$" at -0.7, 0.6

set arrow from -0.25, 0.5 to 0.2, 0.5 as 1

plot 1 - x**2 with lines lt -1 lw 2

unset label
unset arrow
set output "ganancia3.tex"
set label "$1 - \\omega^3$" at -0.7, 0.6

set arrow from -0.25, 0.5 to 0.2, 0.5 as 1

plot 1 - x**3 with lines lt -1 lw 2

unset label
unset arrow
set output "ganancia4.tex"
set label "$\\sqrt{1 - \\omega^2}$" at -0.8, 0.6

set arrow from -0.25, 0.5 to 0.2, 0.5 as 1

plot sqrt(1 - x**2) with lines lt -1 lw 2

unset label
unset arrow
set output "ganancia5.tex"

# x = 1 - alpha => y = 1 
# x = 1 => y = 0
# ax + b = y
# a * (1 - alpha) + b = 1
# a * 1 + b = 0
# => a = -b
# => -b * (1 - alpha) + b = 1
# => -b + b * alpha + b = 1
# => b = 1 / alpha
# => => a = -1 / alpha
alpha = 0.3
f(x) = (x < 1.0 - alpha) ? 1.0 : ((-1.0 / alpha) * x + (1.0 / alpha))

set style arrow 2 nohead lt 2 lw 2
set style arrow 3 nohead lt 1 lw 2
mx = ((1.0 - alpha) + 1.0) / 2.0
dy = 0.1
dx = 0.1
set label "$\\alpha$" at mx, dy
set arrow from 1.0 - alpha, 0 to 1.0 - alpha, 1 as 2
set arrow from mx - dx/2.0, dy to 1.0 - alpha, dy as 1
set arrow from mx + dx, dy to 1, dy as 1
set arrow from 1.0, 0 to 1.0, 2.0 * dy as 3
plot f(x) with lines lt -1 lw 2

