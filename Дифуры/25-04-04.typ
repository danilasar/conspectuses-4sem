#show math.equation.where(block: true): set align(left)
= Лекция 8. 4 апреля 2025. Краевые задачи. Линейные системы дифференциальных уравнений.
#set math.equation(numbering: "1.")
== Краевые задачи

Рассмотрим уравнение

$
#[(1)] y'' + a_1 (x) y' + a_2 (x) y = f(x), space a lt.eq x lt.eq b
$<l8:eq1>

$
#[(2)] y(x_0) = y_0, space y'(x_0) = y'_0 space #[ --- начальное условие]
$<l8:eq2>

@l8:eq1 -- @l8:eq2 --- задача Коши, имеют единственное решение

$
#[(3)] cases(
	alpha_1 y(a) + alpha_2 y'(a) = 0,
	beta_1 y(b) + beta_2 y'(b) = 0
) #[, где] alpha_1, alpha_2, beta_1, beta_2 #[--- заданные числа]
$<l8:eq3>

*Определене*.
/ Краевая задача: --- задача нахождения решения @l8:eq1, удовлетворяющего заданным краевым условиям @l8:eq3

Мы что-то знаем о решении в точке $a$ (согласно первому уравнению системы) и что-то знаем о решении в точке $b$ (согласно второму уравнению системы).

*Примеры*.

1. $cases(
		y'' = 0\, 0 <= x <= 1,
		y(0) = 0, y(1) = 0
)$

Тут легко найти общее решение уравнения, дважды проинтегрировав:

$y = c_1 x + c_2$

Подставляем в краевые условия:

$y(0) = c_2 = 0 \
y(1) = c_1 + underbrace(c_2, = 0) = 0 => c_1 = 0$

Следовательно, $y(x) eq.triple 0$ --- единственное решение.

2. $cases(
		y'' = 0,
		y' (0) = 0, y' (1) = 0
)$

$y = c_1 x + c_2$ --- общее решение. \
$y' (x) = c_1 \
y'(0) = c_1 = 0 \
y'(1) = c_1 = 0$ \
$y(x) = c_2$ --- решение краевой задачи при любом $c_2$.

Вывод из второго примера: краевая задача может иметь бесконечно много решений.

// когда мы стали поочерёдно писать, появилась возможность не только писать, но ещё слушать и понимать
// ага
3. $cases(
		y'' 2\, space 0 lt.eq x lt.eq 1,
		y'(0) = 0\, y'(1) = 0
	)$

$
y'(x) = 2 x + c\
y(x) = x^2 + c_1 x + c_2\
y'(0) = c_1 = 0\
y'(1) = 2 + c_1 = 0 => c_1 = -2
$

*Определение*.

/ Простейшая краевая задача: имеет вид:
$ #[(1)] y'' + q(x) y = f(x) $<l8:eq4> // (1)
$ #[(2)] y(a) = 0, y(b) = 0 $<l8:eq5> // (2)

На примере простейшей краевой задачи можно изучать все краевые задачи.

*Алгоритм решения задачи @l8:eq4 -- @l8:eq5 /*(1)-(2)*/*.

1. Попробуем решить уравнение @l8:eq4. Это не всегда возможно, но бывает такое, что можно.

Получаем

$
#[(3)] y(x) = c_1 phi_1 (x) + c_2 phi_2 (x) + y_ч (x)
$<l8:eq6>

$
phi_1, phi_2 #[--- ф.с.р (лин. нез. решение) уравнения]\
y'' + q(x) y = 0,
$

$y_ч (x)$ --- частные решения @l8:eq4 ,
$c_1, c_2$ --- произвольные константы


2. Подставляем в @l8:eq6 /* (3) */ в @l8:eq5 /* (2) */:
$
cases(
		c_1 phi_1 (a) + c_2 phi_2 (a) + y_ч (a) = 0,
		c_1 phi_1 (b) + c_2 phi_2 (b) + y_ч (b) = 0
) #[ --- линейная алгебраическая система относительно $c_1$ и $c_2$]
$ <l8:eq7> /* (4) */

3. Вычисляем определитель системы @l8:eq7

$
	Delta = mat(delim: "|",
		phi_1 (a), phi_2 (a);
		phi_1 (b), phi_2 (b)
	)
$
#underline[1 случай]. $Delta != 0$ $=>$ @l8:eq7 /*(4)*/ имеет единственное решение.  В этом случае \
$y(x) = c_1 dot phi_1 (x) + c_2 y (y) + y_ч (x)$ --- единственное решение @l8:eq4 -- @l8:eq5.

#underline[2 случай]. $Delta = 0$ $=>$ возникает 2 подслучая.

2.1. Система имеет бесконечно много решений. В этом случае @l8:eq4 -- @l8:eq5 имеет бесконечно много решений
2.2. Система не имеет решений. В этом случае @l8:eq4 -- @l8:eq5 не имеет ни одного решения.



*Следствие*. Рассмотрим краевые задачи @l8:eq4 -- @l8:eq5. Введём в рассмотрение соответствующую однородную краевую задачу.
$
#[(5)] y'' q(x)y = 0, space y(a) = 0, space y(b) = 0
$<l8:eq8>

$
(y(x) eq.triple 0) #[--- решение @l8:eq8]
$

Если @l8:eq8 имеет только тривиальные решение $y(x) eq.triple 0$, то @l8:eq4 -- @l8:eq5 имеют единственное решение $forall f(x)$

*Доказательство*:

Применим наш алгоритм к решению задачи @l8:eq8/*(5)*/.

Решаем @l8:eq8/*(5)*/. Получаем общее решение в виде \
$ y = c_1 phi_1 + c_2 phi_2 (x) #[, где] phi_1 (x), phi_2 (x) #[--- ф. с. р. уравнения @l8:eq8] $/*(5)*/.

Подставляем эту формулу в краевые условия
$
#[(6)] cases(
	c_1 phi_1 (a) + c_2 phi_2 (a) = 0,
	c_1 phi_1 (b) + c_2 phi_2(b) = 0
) #[ --- линейная алгебраическая система относительно $c_1$ и $c_2$]
$<l8:eq9>/*(6)*/

$Delta = mat(delim: "|",
	phi_1 (a), phi_2 (a);
	phi_1 (b), phi_2 (b)
) != 0$, так как в противном случае и тогда задача @l8:eq8/*(5)*/ будет иметь бесконечно много решений.

Теперь, согласно алгоритму, исходная задача имеет единственное решение: $Delta != 0 =>$ система @l8:eq7/*(4)*/ имеет единственное решнеие.

== Линейные системы дифференциальных уравнений

*Определение*
/ Нормальная система дифференциальных уравнений I порядка:

$
#[(1)] cases(
y'_1 = q_11 (x) y_1 + a_12 (x) y_2 + dots + a_(1n) (x) y_n + f_1 (x),
y'_2 = q_21 (x) y_1 + a_22 (x) y_2 + dots + a_(2n) (x) y_n + f_2 (x),
dots dots dots dots dots,
y'_n = q_(n 1) (x) y_1 + a_(n 2) (x) y_2 + dots + a_(n n) (x) y_n + f_n (x)
)
$<l8:eq10>

где $x$--- нез переменная $a lt.eq x lt.eq b$, $y_1 = y_1 (x), dots, y_n = y_n$ --- неизв функция

$
a_(i j) (x) #[--- заданные непрерывные функции (коэффициенты)]
$
$
f_1 (x), dots, f_n (x) #[--- заданные непрерывные функции]
$

*Определение*. 

/ Частное решение системы @l8:eq10/*(1)*/: --- набор функций $phi_1 (x), dots, phi_n (x)$, т. ч.

$
 #[(\*)] phi'_j eq.triple limits(sum)_(k = 1)^n a_(j k) (x) phi(k) + f_j (x), j = overline(1\,n)
$<l8:eq11>/*(*)*/

*Определение*. 

/ Линейная система  @l8:eq10/*(1)*/: называется однородной если $f_1 (x) = dots = f_n (x) = 0$.

*Векторная запись линейной системы*. 

_Условимся, что вектор-функции будут обозначаться заглавными буквами._

Обозначим вектор-функцией

$Y (x) = vec(y_1 (x), y_2 (x), dots, y_n (x)), F (x) = vec(f_1 (x), f_2 (x), dots, f_n (x)), A(x) = mat(
	a_11 (x), a_12 (x), dots, a_(1 n) (x);
	a_21 (x), a_22 (x), dots, a_(2 n) (x);
	dots, dots, dots, dots;
	a_(n 1) (x), a_(n 2) (x), dots, a_(n n) (x);
) $

$
A(x) Y(x) = mat(
	a_(11) (x) y_1 (x) +, a_(12) (x) y_2 (x) +, dots, + a_(1 n) (x);
	dots, dots, dots, dots;
	a_(n 1) (x) y_1 (x) +, a_(n 2) (x) y_2 (x) +, dots, + a_(n n) (x);
)
$
$
A(x) Y(x) + F(x) = mat(
	a_(11) (x) y_1 (x) +, a_(12) (x) y_2 (x) +, dots, + a_(1 n) (x) + f_1(x);
	dots, dots, dots, dots;
	a_(n 1) (x) y_1 (x) +, a_(n 2) (x) y_2 (x) +, dots, + a_(n n) (x) + f_n(x);
)
$

$ Y' (x) = vec(y'_1 (x), y'_2 (x), dots, y'_n (x)) $

$
#[(1)] #[@l8:eq10] <=> Y' = A(x)Y + F(x)
$

Однородная система

$
Y' = A(x) Y
$

Пусть $Phi (x) = vec(phi_1 (x), phi_2 (x), dots, phi_n (x))$.

Тождества @l8:eq11/*(*)*/ $<=>$ $Phi(x) = A(x) Phi(x) + F(x)$

Это означает, что наша вектор-функция $Phi$ даёт решение системы.

*Теорема 1*. Пусть $Phi_1 (x), dots, Phi_m (x)$ --- решения однородной системы
$
#[(1)] Y' = A(x) Y,
$<l8:eq12>/*(1)*/

$ alpha_1, dots, alpha_m #[--- произвольные числа.] $

Тогда функция $Phi (x) = alpha_1 Phi_1 (x) + dots + alpha_m Phi_m (x)$ --- тоже решения @l8:eq12/*(1)*/.

*Доказательство*:

По условию $Phi'_j (x) eq.triple A(x) Phi_j (x), j = overline(1\, m)$.

Расмотрим $Phi'(x) = alpha_1 Phi'_1 (x) + dots + alpha_m Phi'_m (x) = alpha_1 A(x) Phi_1 (x) + dots + alpha_m A(x) Phi_m (x) = A(x) (alpha_1 Phi_1 (x) + dots + alpha_m Phi_m (x)) = A(x) Phi(x)$.

Таким образом, $Phi' (x) eq.triple A(x) Phi(x) => Phi(x)$ --- решение @l8:eq12.
$
cases(
	y'_1 = limits(sum)_(k = 1)^n a_(1 n) (x) y_k + f_1 (x)\, space y_1 (x) = y_1^0,
	dots,
	y'_n = limits(sum)_(k = 1)^n a_(n n) (x) y_k + f_n (x)\, space y_n (x) = y_n^0,
)
$

где $x_0, y_1^0, dots, y_n^0$ --- заданные числа

Обозначим

$
Y^0 = vec(
	y_1^0,
	dots,
	y_n^0
)
$
$
#[@l8:eq11/*(*)*/] <=> cases(
	Y = A(x) Y + F(x),
	Y(x_0) = Y^0 #[ --- начальное условие]
)
$
*Определение*. Пусть $Phi_1 (x), dots, Phi_m (x)$ --- векторная функция разм-ти $n$ опред.

эти векторные функции линейно зависимы на $[a, b]$, если $exists alpha_1, dots, alpha_m$ --- числа, не все равные 0, так что
$
  alpha_1 Phi_1 (x) + dots + alpha_m Phi_m (x) eq.triple overline(0) space spcae forall x in [a, b]
$

*Определение*. Вектор-функция $Phi_1 (x), dots, Phi_m (x)$ называются *линейно независимыми* на $[a, b]$, если
$
  alpha-1 Phi_1 (x) + dots + alpha_m Phi_m (x) eq.triple vec(0) <=> alpha_1 = dots = alpha_m = 0
$



