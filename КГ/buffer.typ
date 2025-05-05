

#grid(columns:2,
$ sigma_0 = x_2 - x_1 $, $sigma_0 > 0$,
..{
	for i in range(1,4) {
		let j = i - 1
		($sigma_#i = sigma_#j - 2 (y_2 - y_1)$, if i == 3 { $sigma_3 <= 0$} else {$delta_#i > 0$})
	}
	}
)

#grid(columns: 2,
grid.cell(colspan:2, 
$$
),
image("imgs/199.png"),
```
```
)


#image("imgs/200.png")
#image("imgs/201.png")

Мы получили универсальный целоисленный алгоритм Брезенхема.

#grid(columns: 2,
grid.cell(rowspan:2,
image("imgs/204.png")),
image("imgs/203.png"),
$
	Delta z = (z_2 - z_1)/(delta x) \
	Delta r = (r_2 - r_1)/(delta x) \
	Delta g = (g_2 - g_1)/(delta x) \
	Delta b = (b_2 - b_1)/(delta x)
$
)

- $y_"min"$
- $y_"max"$
- $"AEL"$
- $y_"cr"$
- $y_"cur"$

$y_"cur" = y_"cr" = 1 \
"AEL" = {} \
"AEL" = { Q A, P O, N O, N M, L M< L K} = {(5, -1, 5), (7, 1, 3), (12, - 3/2, 3), (12, 1, 3), dots}$

Каждое входящее в него ребро будет представлен тройкой значений. Это список рёбер, которые пересекает текущая строка растра.