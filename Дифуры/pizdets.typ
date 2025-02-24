
*Теорема 4.* Дифференциальные уравнения в полных дифференциалах.

*Определение.* Рассмотрим дифференциальное уравнение (1) и $M(x, y) dif x + N(x, y) d y = 0$

Уравнение (1) называется уравнением в полных дифференциалах, если

$ frac(dif M(x, y), dif y) eq.triple frac(dif N(x, y), dif x) $

Считаем, что $y = y(x), N(x, y) != 0$.

Тогда по определению (1) эквив. ур-ию

$ frac(dif y, dif x) = - frac(M(x, y), N(x, y)) $

=== Алгоритм решения

1. Пусть выр-ся (2)

2. Найдём вспомогатльную функцию $Phi(x, y)$ как решение след. системы ур-й

$ (*) cases(
	frac(dif Phi (x, y), dif x) = M(x, y),
	frac(dif Phi(x, y), dif y) = N(x, y)
) $

3. Рассмотрим 1-е уравнение в (\*). Фиксируем y. Тогда получаем

$ frac(dif Phi(x, y), dif x) = M(x, y) $

$ Phi(x, y) = integral M(x, y) dif x = limits(integral)_(x_0)^x M(t, y) d t + C(y) $

4. Подставляем эту во 2-е уравнение:

$ frac(dif, dif y) (limits(integral)_(x_0)^x M(t,y) dif t + dif y) = N(x, y) $

$ limits(integral)_(x_0)^x frac(dif M(t, y), dif y) dif t + C'(y) = N(x, y) $

На основании (2):

$ limits(integral)_(x_0)^x frac(dif N(t, y), dif t) dif t + C'(y) = N(x, y) $

Применяем формулу Ньютона-Лейбница:

$ #strike($N(x, y)$) - N(x_0, y) + C'(y) = #strike($N(x, y)$) $ // todo

$ C'(y) = N(x_0, y) => c(y) = integral N(x_0, y) dif y => Phi(x,y) = limits(integral)_(x_0)^x M(t,y) dif t + limits(integral) N(x_0, y) dif y $

5. Рассмотрим уравнение относительно $y$:

(\*\*) $Phi(x, y) = C$, $C$ --- произвольная константа

6. Решаем (\*\*) и находим

$ y= phi(x, c) #par[--- общее решение уравнения (1)] $

#underline[Замечание].

Не всегда мы можем найти $y$ в явном виде. В этом случае, когда не можем, ответ будет такой:

$ phi(x, y) = C #par[--- общее решение в неявном виде, он же общий интеграл] $


