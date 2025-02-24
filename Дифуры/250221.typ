#set math.equation(numbering: "1.")
= Лекция 2. 25 февраля 2025

$ y' + p(x)= q (x) "(1)" $<eq1>

*Теорема 1*. Общее решение

$ y = e^(-integral p(x) d x) (integral e^(integral p(x) d x) q(x) d x + C) $
в  
Метод вариации произвольной постоянной

Рассмотрим линейное уравнение (@eq1) в канонической форме

#underline("1 этап.") Решим соответствующее однородное уравнение

$ y' + p(x) y = 0, $<eq2>

$ (d y)/(d x) = - p(x) y | dot d x, space 1/y $

$ frac(d y, y ') = -p(x) dif x + c $

$ integral frac(dif y, y') = - integral p(x) dif x + c $

$ ln |y| = -F(x) + C; $

$ |y| = e^(-F(x) + C) $

$ |y| = e^C e^(-F(x)) $

$ y = plus.minus e^c e^(-F(x)) = c_1 e^(-F(x)), space c_1 eq.not 0 $

$ y(x) eq.triple 0 $

$ y_0 = C e^(-F(x)), C in RR $

--- общее решение (@eq2)

#underline("2 этап.") Ищем решение (@eq1) в виде

$ y = c(x) e^(-F(x)), $

где $c(x)$ --- пока неизвестная функция

$ y' (x) = c'(x) e^(-F(x)) + c(x) e^(-F(x)) dot (-F'(x)) = c'(x) e^(-F(x)) - c(x) e^(F(x)) $

Напомним себе, что $F(x) = integral p(x) dif x$. Подставляем получившиеся формулы ($y$ и $y'$) в левую часть (@eq1):

$ c' (x) e^(-F(x)) - #strike($c(x) e^(-F(x)) p(x)$) + #strike($p(x) c(x) e^(-F(x))$) eq.triple q(x) $ // todo

$ c'(x) e^(-F(x)) eq.triple q(x); $

$ c'(x) = e^(F(x)) q(x) => c(x) = integral e^(F(x)) q(x) d x + c o n s t => $

$ => y (x) = e^(-F(x)) (integral e^(F(x)) q(x) d x +c) $

--- как в теореме 1.

Линейные уравнения на контрольной решать только методом вариации, другие не рассматриваются.

Мы разобрались с линейными уравнениями, теперь на очереди 

== Диффф.еренциальные  уе.р-авненияи рв пеолных дифференциалах

/ Опр.: Рассмотрирт диффеукренциальные уравнение в форме?

+ $ M(x, y) d x+ $


Считаем , что y$  y   = y(x)$, $N(x, y)* = eq.not  $




== Алгоритм решения 

+
+ (eq3)
+ Рссм 1-е уравнение в (eq3) Фикс $y$ Тогда получаем $(d Phi (x, y))/(d x) = M (x, y)$

$ Phi (x, y) = integral M (x, y) d x = limits(integral)^x_(x_0) M(t, y) d t + c (y) $

+ Подставляем эту во 2-е ур

$ diff/(diff y) (limits(integral)^x_(x_0) M(t, y) d t + d y) = N(x, y) $


$ limits(integral)^x_(x_0) (diff M (t, y))/(diff y) d t + c' (y) = N(x, y); $

Из (2)

$ limits(integral)^x_(x_0) (diff N(t, y))/(diff t) d t + c'(y) = N (x, y); $<eq4>

$ N(x, y) - N(x_0, y) + c'(y) = N(x, y) $<eq5>

$ c'(y) = N(x_0, y) => c(y) = integral N(x_0, y) d y = > Phi (x, y) = limits(integral)^x_(x_0) M(t, y) d t + integral N (x_0, y) d y $

5. Рассм уравнение (относительно $y$)
$ Phi(x, y) = c, $<eq6>

$c$ --- произвольная константа

6. Решаем (@eq6) и находим

$ y = phi(x, c) $

--- общ решение (1)

=== Замечание 

Не всегда можно найти в явном виде. В это случае

Отв. $Phi(x, y) = c$ --- общий интеграл


// TODO:
// todo egor end
// todo danya start

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

// TODO:
// todo danya end

*Теорема 2*. Обоснование алгоритма

*Доказательство*:

Пусть $y = phi(x, c)$ --- функция неявно задаются уравнением (@eq6) Это означает

$Phi(x, phi(x, c)) eq.triple C | frac(dif, dif x)$

$ frac(diff, diff x) F(g(x)) = F'(g(x)) g'(x) $

$ F(x_1 (t), x_2 (t)) = G(t) $

$ G'(t) = frac(diff F(x_1(t), x_2(t)), diff x_1) x'_1 (t) + frac(diff F(x_1(t), x_2(t)), diff x_2) x'_2 (t) $


$ (diff Phi (x, phi(x, c)))/(d x) + frac(diff Phi(x, phi(x, c)), diff y) phi'(x, c) eq.triple 0 limits(eq.triple)^"по построению" M(x, phi(x,c)) + underbrace(N(x, phi(x, c)), = 0) phi'(x, c) eq.triple 0$

$ phi' (x, c) eq.triple - (M(x, psi(x, c)))/(N(x, phi(x, c))) => y = phi(x, c) $

--- решение (3) при любом

ч. т. д.

=== Рассмотрим произвольное уравнение в симитрической форме

$ A(x, y) dif x + B(x, y) dif y = 0 $ <eq10>

$ (diff A)/(diff y) eq.not (diff B)/(diff x) $

#underline[Теорема]. Сущ-ие функция $mu(x, y) != 0$

$ mu (x, y) A(x, y) d x + mu(x, y) B(x, y) d y = 0 $<eq11>

В полных дифференциалах


*Определение*. Функция $mu(x, y)$ называется интегрирующим множеством для уравнения (@eq10)

=== Пример:

Рассмотрим уравнение:

$ (d y)/ (d x) = f_1 (x) f_2 (y); $


$ underbrace(f_1(x) f_2(y) dif x, #par[не является\ уравнением\ в полном\ дифференциале]) - dif y = 0 $

$ underbrace(f_1 (x), M(x, y)) d x - underbrace(1/(f_2 (y)), N(x, y)) d y = 0 $

$ (diff M)/(diff y) eq.triple 0, (diff N)/(diff x) eq.triple 0 $


=== Рассмотрим уравнение

$ y' = f(x, y), space a lt.eq x lt.eq b $<eq15>

/ Опр.: 

Пусть $x_0 in [a, b]$, $y_0$ --- заданные числа.

/ Задачей Коши: для уравнения @eq15 называется задача нахождения такого решения $y(x)$ (из бесконечного множества решений), которое удовлеторяет условию:

$ y(x_0) = y_0 #par[--- в заданной точке оно принимает заданное значение\ (начальное условие)] $<eq16>

(@eq15) -- (eq16) --- задача Коши

*Основная теорема о существовании и единствнности* для уравнения @eq15.

Рассмотрим задачу Коши @eq15 - @eq16. Предположим, что $f(x, y)$ непр. вместе с $frac(diff f(x, y), diff y)$.

Тогда задача Коши @eq15 - @eq16 имеет единствнное решение.

$ y' = f(x, y), space a lt.eq x lt.eq b $
$ y(x_0) = y_0 $

Первый этап доква:

#underline[1 этап].

Сведение задачи Коши (@eq15) (@eq16) к интегральному ураввнению

Пусть $phi(x)$ --- решение (@eq15) (@eq16)

$ phi'(x) eq.triple integral.dash (x, phi(x))  " или " phi'(t) eq.triple f (t, phi(t)) | limits(integral)^x_(x_0) d t $
$ phi (x_0) = y_0 $

По формуле Ньютона-Лейбница:

$ phi(x) - phi(x_0) eq.triple limits(integral)_(x_0)^x f(t, phi(t)) dif t $

$ phi(x) = y_0 + limits(integral)_(x_0)^x f(t, phi(t)) dif t $ <eq17> // 3

Тождество @eq17 означает, что $phi(x)$ является решением следующего интегрального уравнения

$ y(x) = y_0 + limits(integral)^x_(x_0) f(t, y(t)) d t, space a lt.eq x lt.eq b $ <eq18> // 4

*Вывод*: любое решение @eq15 - @eq16 является решением @eq18. Докажем обратное.

Пусть $phi(x)$ --- решение, т.е. @eq17:

$ phi (x) eq.triple y_0 + limits(integral)_(x_0)^x f(t, phi(t)) dif t | dif / (dif x)$ // 3

$phi'(x) eq.triple f(x, phi(x)) => phi(x)$ --- решение (1)

Как же быть с начальным условием? Из формулы @eq17 следует,что

$ phi(x_0) = y_0 + limits(integral)_(x'_0)^(x_0) dots dif t = y_0 => phi(x_0) = y_0 $

*Вывод*: $phi(x)$ --- решение @eq15 - @eq16.

Теорема доказана.





























