$
	"Translate"(T_x, T_y, T_z) = mat(
		1, 0, 0, T_x;
		0, 1, 0, T_y;
		0, 0, 1, T_z;
		0, 0, 0, 1
	)
$

== Масштабирование

$
	cases(
		x' = S_x x,
		y' = S_y y,
		z' = S_z z
	)
$

$
	"Scale"(S_x, S_y, S_z) = mat(
		S_x, 0, 0, 0;
		0, S_y, 0, 0;
		0, 0, S_z, 0;
		0, 0, 0, 1
	)
$

== Поворот на угол $theta$ относительно оси

Эта задача уже значительно сложнее. Дело в том, что у нас вместо одного преобразования поворота будет три преобразования вращения.

Положительное вращение --- это вращение против часовой вокруг оси (мы при этом смотрим со стороны $+infinity$ в сторону $-infinity$ по ней). Выходит, координаты по этой оси остаются неизменными, а изменяются две другие.

=== Поворот на угол $theta$ относительно оси $O_z$ против часовой стрелки

$
	cases(
		x' = x cos theta - y sin theta,
		y' = x sin theta + y cos theta,
		z' = z
	)
$

$
	(x, y, z) => (chi, gamma, theta, alpha) => cases(
		x = chi / alpha,
		y = gamma / alpha,
		z = theta / alpha
	)
$

$
	"Rotate"_z (theta) = mat(
		cos theta, -sin theta, 0, 0;
		sin theta, cos theta, 0, 0;
		0, 0, 1, 0;
		0, 0, 0, 1
	)
$

=== Поворот на угол $theta$ относительно оси $O_x$ против часовой стрелки

По аналогии, если мы вращаем относительно оси $x$, мы можем выполнить замену $x => y, y => z, z => x$. Ориентация системы сохраняется.

$
	cases(
		x' = x,
		y' = y cos theta - z sin theta,
		z' = y sin theta + z cos theta
	)
$
Выходит, что
$
	cases(
		chi' = x,
		gamma' = gamma cos theta - zeta sin theta,
		zeta' = gamma sin theta + zeta cos theta,
		alpha' = alpha
	)
$
Соответственно получим матрицу вращения относительно $O_x$:
$
	mat(
		1, 0, 0, 0;
		0, cos theta, -sin theta, 0;
		0, sin theta, cos theta, 0;
		0, 0, 0, 1
	) mat(
		chi;
		gamma;
		zeta;
		alpha
	)
$

=== Поворот на угол $theta$ относительно оси $O_y$ против часовой стрелки

Следующий переход будет похожий. Когда мы вращаем относительно $y$, мы обозначаем $x => z, y => x, z => y$.

Теперь роль $z$ выполняет $y$, то есть равенство превратится в
$
	cases(
		x' = z sin theta + x cos theta,
		y' = y,
		z' = z cos theta - x sin theta
	)
$

Перейдём к однородным координатам:

$
	cases(
		chi' = chi cos theta, zeta sin theta,
		gamma' = gamma,
		zeta' = - chi sin theta + zeta cos theta
	) 
$

И получим матрицу:
$
	mat(chi'; gamma'; zeta'; alpha') = mat(
		cos theta, 0, sin theta, 0;
		0, 1, 0, 0;
		-sin theta, 0, cos theta, 0;
		0, 0, 0, 1
	) mat( chi; gamma; zeta; alpha )
$

Косинусы остались на своих местах, но у нас произошёл циклический сдвиг: одна строка сдвинулась вниз, другая ушла вверх, у синуса поменялся знак.

== Совмещение преобразований

Мы должны перейти в такую систему координат, что наша ось вращения будет новой координатной осью. 

#table(columns: 2, stroke: none,
	image("imgs/034.png"),
	$
		cases(
			cos alpha = n_1 / sqrt(n_1^2 + n_3^2),
			sin alpha = n_3 / sqrt(n_1^2 + n_3^2)
		)
	$
)

#table(columns: 2, stroke: none,
	image("imgs/035.png"),
	$
		cases(
			cos beta = n_2,
			sin beta = sqrt(n_1^2 + n_3^2)
		)
	$,
	table.cell(colspan: 2)[То, что раньше было гипотенузой, стало новой осью $x$.]
)

#image("imgs/036.png")
#image("imgs/037.png")
#image("imgs/038.png")
#image("imgs/039.png")

Итого мы получаем 7 различных преобразований (3 прямых вращения и 2 обратных). Этот способ плох тем, что здесь слишком много перемножений матриц, слишком много частных случаев и слишком много умножений. Отсюда следует, что данный подход плохо подходит для интерактивной графики в силу своей трудоёмкости.

// это пиздец, я еле успеваю в соло писать

== Преобразование Родригеса

/ Преобразование Родригеса: --- преобразование вращения относительно произвольной оси, проходящей через начало координат, на заданный угол $theta$.

Само вращение будет несколько сложнее, чем в предыдущем случае, хотя с математической точки зрения хорош и красив.

Пусть ось задаётся единичным вектором. Тогда функция Rotate определяется им и углом поворота:

$ "Rotate"(overline(n), theta) $


#image("imgs/040.png")
#image("imgs/041.png")
#image("imgs/042.png")
#image("imgs/043.png")
#image("imgs/044.png")

$overline(p)$ --- радиус-вектор $P$.

Тогда $overline(p) = overline(p)_parallel + overline(p)+perp$, где $overline(p)_parallel$ --- проекция вектора на ось, заданную вектором $overline(n)$, причём

$overline(p)_parallel = overline(n) dot (overline(p) dot overline(n)) \
overline(p)_perp = overline(p) - overline(p)_parallel$

Входит, что

$overline(p)' = overline(p)'_parallel + overline(p)'_perp \
overline(p)' = overline(p)_parallel + overline(p)'_perp$

#image("imgs/045.png")
#image("imgs/046.png")

Пусть $overline(r) = overline(n) times overline(p)$. Тогда

#let vec(n) = $overline(#n)$

$
| vec(r) | = | vec(n) | dot | vec(p) | sin angle vec(n) vec(p) = | vec(p) | sin angle vec(n) vec(p) = cancel(| vec(p) |) dot (|vec(p)_perp|)/cancel(|vec(p)|) = |vec(p)_perp| => | vec(r) | = | vec(p)_perp|
$

#image("imgs/047.png")
#image("imgs/048.png")
#image("imgs/049.png")
#image("imgs/050.png")
#image("imgs/051.png")
#image("imgs/052.png")
#image("imgs/053.png")
#image("imgs/054.png")
#image("imgs/055.png")


$P' = M dot P$

Чтобы записать всё это в матричной форме, необходимо всё это в неё превратить.

Напомним себе, $vec(n)$ --- это вектор-столбец. 

*Формула Родригеса* выводится сдедующим образом:

$
	vec(p)' = vec(p)_parallel + vec(p)'_perp = (vec(p) dot vec(n)) vec(n) + vec(p)_perp cos theta + vec(r) sin theta = \
	(vec(p) dot vec(n)) vec(n) + (vec(p) - vec(p)_parallel) cos theta + (vec(n) times vec(p)) sin theta = \
	(vec(p) dot vec(n)) vec(n) + (vec(p) - (vec(p) dot vec(n)) vec(n)) cos theta + (vec(n) times vec(p) sin theta = \
	vec(n) (vec(n)^T vec(p)) + vec(p) cos theta - vec(n) (vec(n)^T vec(p)) cos theta + [vec(n)]_times vec(p) sin theta = \
	(cos theta) E vec(p) + (1 - cos theta)(vec(n)vec(n)^T) vec(p) + (sin theta)[vec(n)]_times vec(p) = \
	((cos theta)E + (1 - cos theta) vec(n) vec(n)^T + (sin theta) [vec(n)]_times) vec(p)
$

$
	vec(p)' = underbrace(((cos theta)E + (1 - cos theta) vec(n) vec(n)^T + (sin theta) [vec(n)]_times), #par[преобразование Родригеса]) vec(p)
$

// HACK: сука разъебите меня болгаркой

Отсюда выходит, что
$
	"Rot"(vec(n), theta) = (cos theta) E + (1 - cos theta) vec(n) vec(n)^T + (sin theta) [ vec(n) ]_times
$

$
	vec(n) vec(n)^T = mat(n_1; n_2; n_3) mat(n_1, n_2, n_3) = mat(
		n_1^2, n_1 n_2, n_1 n_3;
		n_2 n_1, n_2^2, n_2 n_3;
		n_3 n_1, n_3 n_2, n_3^2
	)
$

$
	[vec(n)]_times^2 = mat(
		0, -n_3, n_2;
		n_3, 0, -n_1;
		-n_2, n_1, 0
	) mat(
		0, -n_3, n_2;
		n_3, 0, -n_1;
		-n_2, n_1, 0
	) = mat(
		-n_3^2, n_1 n_2, n_1 n_3;
		n_2 n_1, -n_1^2 - n_3^2, n_2 n_3;
		n_3 n_1, n_3 n_2, -n_1^2 - n_2^2
	)
$

Так как вектор $vec(n)$ единичный, то $|vec(n)| = 1, space n_1^2 + n_2^2 + n_3^2 = 1$. И, соответственно, его длина $vec(n) = sqrt(n_1^2 + n_2^2 + n_3^2) = 1$.

Если посмотреть дальше, то
$
	cases(
		n_1^2 = 1 - n_2^2 - n_3^2,
		n_2^2 = 1 - n_2^1 - n_3^2,
		n_3^2 = 1 - n_1^2 - n_2^2,
	)
$

Именно этим и отличается матрица $vec(n) vec(n)^T$ от $[vec(n)]_times^2$ по главной диагонали, а все остальные элементы одинаковы. По сути $vec(n) vec(n)^T = E + [vec(n)]_times^3$

Давайте заменим в формуле Родригеса на то, что получили сейчас:

$
	"Rot"(vec(n), theta) = (cos theta) E + (1 - cos theta) vec(n) vec(n)^T + (sin theta) [ vec(n) ]_times = \
	(cos theta) E + (1 - cos theta)(E + [vec(n)]_times^2) + (sin theta)[vec(n)]_times = \
	(cos theta) E + (1 - cos theta) E + (1 - cos theta)[vec(n)]_times^2 + (sin theta)[vec(n)]_times = \
	E + (sin theta)[vec(n)]_times + (1 - cos theta)[vec(n)]_times^2 = \
	mat(
		1, 0, 0;
		0, 1, 0;
		0, 0, 1
	) + mat(
		0, -n_3, n_2;
		n_3, 0, -n_1;
		-n_2, n_1, 0
	) sin theta + mat(
		-n_3^2 - n_2^2, n_1 n_2, n_1 n_3;
		n_2 n_1, -n_1^2 - n_3^2, n_2 n_3;
		n_3 n_1, n_3 n_2, - n_1^2 - n_2^2
	) (1 - cos theta)
$

Таким образом получаем

$
	"Rotate"(vec(n), theta) = mat(
		mat(,,;,"Rot"(vec(n), theta),;,,), mat(delim: #none, 0; 0; 0);
		mat(delim: #none, 0, 0, 0), mat(delim: #none, 1)
	)
$