= Лекция по терверу
, где
- $n$ --- количество испытаний Бернулли,
- $p$ --- количество успешных испытаний

Обратим внимание, что нулевое слагаемое тождественно равно нулю, поэтому сумму можно считать с единицы. Разделим $p^k$ на два множителя.


После элементарных преобразований с $q$ и $n$ Перейдём к новой переменной $m$, которая равна $k - 1$. Не забывая, что сумма вероятностей равна единице, $(p + q)^(n - 1) = 1$

Предположим случайную величину $xi = epsilon_1 + epsilon_2 + dots + epsilon_n$, $epsilon_i ~ "Bern"(p)$.

$M_xi = M(epsilon_1 + epsiloon_2 + dots + epsilon_n) = M xi_1 + dots + M xi_n = p + p + dots + p = n p$

Следующее распределение, которое мы посмотрим, --- это распределение Пуассона.

== 3. Распределение Пуассона

$xi$ --- количество успехов в большом.


$M_xi = limits(sum)_(k = 0)^infinity k frac(e^(-lambda) dot lambda^k, k!) - e^(-lambda) dot lambda limits(sum)_(k = 1)^infinity frac(lambda^(k - 1), (k - 1)!) = e^(-lambda) limits(sum)_(m = 0)^infinity frac(lambda^m, m!) = e^(-lambda) dot lambda dot e^lambda = lambda$ ($lambda = n p$ из т. Пуассона)

$limits(sum)_(k = 0)^infinity frac(x^k, k!) = e^lambda$


$M_(xi^2) = limits(sum)_(k = 0)^infinity = k^2 frac(e^(-lambda) lambda^k, k!) = e^(-lambda) limits(sum)_(k = 1) frac(k dot k dot lambda^(k - 1) lambda, k dot (k - 1)!) = lambda e^(-lambda) limits(sum)_(k = 0)^infinity frac(k lambda^k - 1, (k - 1)!) limits(=)^(m = k - 1)_(k = m + 1) = $


$D xi = M (xi^2) - (M xi)^2 = lambda^2 + lambda - lmbda^2 = lamda$

$xi ~ "Pois"(lambda), M xi = lambda, D xi = lambda, sigma = sqrt(lambda)$

== 4. Геометрическое распределение

Тогда закон распределения у нас имеет следующий вид:

$P {xi = k} = p dot q^(k - 1)$


Следует обратить внимание, математическое ожидание вычисляется сразу как сумма с единицы, а не с нуля. Интересный финт ушами: $k dot q^(k - 1) = (q^k)'$. Ну а сумма производных в то же время есть производная суммы, так что выносим черту за сигму. Дальше дело арифметики.

В задачах, где дана случайная величина, эквивалентная распределению, и требуется вычислить мат ожидание, как правило, достаточно ограничиться написанием формулы, вывод не нужен. Например:

$Chi ~ G(0, 3) \
M Chi = 1/0.3 = 10/3$

== Характеристики непрерывных случайных величин

=== Нормальное распределение (Гаусса)
$f(x) = 1/(sqrt(2 pi) sigma) e^(frac(-(x-a)^2, 2 sigma^2))$


$M xi = M (sigma xi_0 + a) =  sigma M xi_0 + a\
D xi = sigma^2 D xi_0$

$
  mat(delim: "[",
    t = (x^2)/2, space, dif t = x dif x;
    x |_(infinity)^infinity, ->^t, |_infinity^infinity ?
  )


= 1/sqrt(2 pi) (-(-e^(-t)))|_0^infinity + (-e^(-t))|_0^infinity
= 1/sqrt(2 pi) (limits(lim)_(t -> + infinity) e^(-t) - e^0 - (limits(lim)_(t -> +infinity 1/(e^t) -e^0)))

$


Интегрируем по частям.

$
  mat(delim: "[",
    x = u, dif u - dif x;
    x e^((-x^2)/2 dif x = dif v), v  -e^((-x^2)/2)
  )
$

*Интеграл Пуассона*: _был выведен в процессе изучения расширения шара под воздействием температуры_

$limits(integral)_(-infinity)^infinity e^((-x^2)/2) dif x= sqrt(2 pi)$


$xi_0 ~ N(0, 1)$ #h(5pt) $M xi_0  0, D xi_0 = 1, sigma = 1$

=== 2.
$xi ~ R(a; b)$ #h(5pt) $f_xi = cases(
  
)$

$M xi = limits(integral)_(infinity)^infinity x f(x) dif x = limits(integral)_a^b 1/(b - a) dif  = 1/(b - a) (x^2)2 |_a^b  frac(b^2 - a^2, 2(b - a) = frac(b + a, 2))$

$D xi = frac(b^2 + a b + a^2, 3) - frac((b + a)^2, 4) = dots = frac((b - a)^2, 12)$

*Примечание.* Опущенный в лекции вывод дисперсии потребуется воспроизвести на зачёте, если такой вопрос выпадет.


== Характеристические функции (х. ф.)

Пусть $xi_1$ и $xi_2$ --- случайные величины, заданные на одном и том же вероятностном пространстве на в. п. $(Omega, cal(F), P)$

/ Комплексная случайная величина: $eta = xi_1 + i xi_2$ ($i^2 = -1$)

Математическим ожиданием коплексной случайной величины называется величина $M eta = M xi_1 + i M xi_2$

/ Характеристическая функция случайной величины $xi$: --- функция $phi(t) = M e^(i t xi)$, где $t in RR$

:w
