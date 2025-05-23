== Лекция не знаю какая, 25 марта 2025
Мы сформулировали теорему, которая носит обобщающий характер, это:

/ Теорема о существовании случайной величины с заданной функцией:

Пусть функция F(x) такая, что её $limits(lim)_(x -> +infinity) F(x) = 1$, $limits(lim)_(x -> -infinity) F(x) = 0$, $F(x)$ непрерывна слева.

Тогда $exists$ вероятностное пространство $(Omega, cal(F), P)$ и сл. в $xi$ на нём, для которой $forall x <= RR space P { xi < x } = F(x)$, то есть функция распределения совпадает с $F(x)$

И аналогично $f(x) gt.eq 0$ такая что $limits(integral)_(-infinity)^(infinity) f(x) d x = 1$

Тогда $exists$ вероятностное пространство $(Omega, cal(F), P)$ и случайная величина $xi$ на нём, для которой при всех $forall x in RR$ вероятность $P { xi < x } = limits(integral)_(-infinity)^x f(t) dif t$.

Тогда можно перейти уже к классификации случайной величин и будем заниматься построением вероятностной модели некоторых стохастических экспериментов. Все задачи в теории вероятностей можно классифицировать по типу модели. Мы строим решения задач с определёнными свойствами, а дальше будут возникать лишь частные случаи таких задач, незначительно отличающиеся от оригиналов.

== Виды дискретных распределений
Лучший общий список дискретных распределений можно увидеть в книжках по машинному обучению. Хорошая есть в тг-канале Агафоновой, она как раз и начинается со сводки по теории вероятностей.
// сначала просто перечисление напишем, а если она рассказывать будет, то в секциях
// упростим себе навигацию
1. Распределние Бернули
2. Биномиальное распределение
3. Распределение /*Па*/Пуассона
// ок
4. Геометрическое распределение
=== Распределение Бернули

// HACK: Адам спрашивает у Бога:
// - Господи, почему ты сделал Еву такой красивой?
// - Чтобы она тебе понравилась, сын мой.
// - Боже, но почему же ты сделал ее такой глупой?
// - А это, чтобы ты ей понравился…

$
epsilon ~ B e r n (p)
$
случайная $epsilon$ распределена по Бернули

Пусть в стохастическом эксперементе с множество элементарных исходов $Omega$ различают два события $A$ и $overline(A)$:
+ Событие $A$ называем успехом
+ Событие $overline(A)$ называем неуспехом

Вероятность:
$
	p = P(A)\
	q = 1 - p = P(overline(A))
$

1 --- наступило 
-1 --- не наступило

Введем случайную величину $epsilon$, которая равна $1$, если наступило $A$ или $0$, если наступило $overline(A)$

$
	epsilon(A) = I(A)= cases(
		1\, space w in A,
		0\, w in.not A
	)
$

// FIX: image("imgs/024.png")


// HACK: В зоопарке медведь жалуется директору:
// - Переведите меня в другую клетку, я так больше жить не могу! У меня справа обезьяна, а слева жираф. Обезьяна весь день анекдоты рассказывает, а жираф всю ночь смеется.
// ахаххахаахахах

==== Ряд распределения 
#table(columns: 2, stroke: none,
	table(columns: 3,
		$epsilon$, $0$, $1$,
		$p$, $q$, $p$
	),
	$
		(p + q = 1)
	$
)

Тогда закон распределения 
$ P { epsilon = k } = p^k q^(1 - k); k in {0, 1} $

Следующий момент, мы строим функцию распределения.

==== Функция распределения

Нужно построить график

$ F(x) = P{epsilon lt x} $
$ F(x) = cases(
	0\, x lt.eq 0,
	q\, 0 < x <= 1,
	1\, x > 1
) $


// FIX: #image("imgs/025.png")
// уже прибавил предыдущая была 024

Переходим к следующему распределению

Из распределения Бернули складываются другие распределения


=== Биномиальное распределение

$
epsilon ~ B i n (n, p)
$

// HACK: На приеме у психотерапевта:
// - Доктор, меня все игнорируют.
// - Следующий!

Случайная величина $xi$ распределена по биномиальному закону с параметрами $n$ и $p$.

Пусть произведено $n$ незвисимых одинаковых испытаний Бернулли // TODO: поправить везеде на Бернулли

Веоятность успеха практически не зависит от номера испытания, то есть у нас $p approx p(n) $.

// HACK: Рабинович каждый день ходит в синагогу и молится:
// - Господи, помоги мне выиграть в лотерею. Ну, пожалуйста, помоги мне выиграть в лотерею.
// Это продолжается несколько месяцев. Во время очередной молитвы откуда-то сверху вдруг раздается божественный голос:
// - Рабинович, купи хотя бы один лотерейный билет!
// ахаххахахахаххахах

Берем случайную велечину $xi$, которая равна количству "успехов" $n$ незваисимых испытаний Бернулли.

// HACK: Фразу "Если не стоит, то и не стоит" мужчины и женщины читают по-разному.

Введем $Omega = {overline(omega) = (epsilon_1, epsilon_2, dots, epsilon_n) : epsilon_i in {0, 1}}$

$ |Omega| = 2^n $

Модель: дискретное вероятностное пространство, так как исходы неравновозможны

Пусть событие $A$ --- ровно $k$ "успехов"

$ A = { overline(omega) = (epsilon_1, epsilon_2, dots epsilon_n) : | overline(w) | = k; epsilon_1 + epsilon_2 + dots + epsilon_n = k } $
// HACK: Когда я ем, я глух и нем. Когда я пью, я жутко коммуникабельный.

Вероятность исхода $P(overline(omega)_i) = P(overline(omega)_j) #[ если ] space overline(omega) in A $

Давайте найдём вероятность фиксированного исхода:
$ P(overline(w)^\*) = {P(epsilon_1 = 1, dots epsilon_k = 1, epsilon_(k + 1) = 0, dots epsilon_n = 0)} = $

$
limits(=)^#[Требование независимости] 
$ 

$
P {epsilon_1 = 1} P{epsilon_2 = 1} dots\
P {epsilon_k = 1} P {epsilon_(k + 1) =0} dots \
P {epsilon_n = 0} = p^k q^(n - k)
$

// HACK: Миша - еврей не по папе и не по маме. Миша - еврей по ситуации.
// -- Егор тоже))

Давайте посчитаем. У нас получается, что мы нашли вероятность одного успеха. Мы также уточним, что мы работаем в дискретном пространстве. Теперь вычислим количество способов из $n$ мест выбрать $k$ для того, чтобы поставить на них единицы:

$
|A| = C^k_n
$

Следовательно вероятность того, что $xi = k$ это вероятность события A = равна сумме вероятностей всех исходов. На математическом языке:
$
	P { xi = k } = P(A) = limits(sum)_(overline(w) in a) P(overline(w)) \
	= limits(sum)_(overline(omega) in A)^n p^k q^(n - k) = C^k_n p^k q^(n - k) space forall k in {0, 1, dots, n}
$

Покажем, что $limits(sum)_(k = 0)^n P{ xi = k } = 1$.

$
	underbrace(limits(sum)_(k = 0)^n C_n^k p^k q^(n - k), #par[узнали бином Ньютона?]) = (p + q)^n = 1^n = 1
$
// HACK: Когда мяч попал в штангу, тяжелоатлет уронил ее и погнался за футболистом.
Таким образом биномиальное распределение имеет вид $xi ~ "Bin"(n, p)$:

$
P {epsilon = k} = C^k_n p^k q^(n - k), space forall k in {0, 1, dots, n}
$

В такой ситуации ряд распределения выглядит не очень хорошо, но в конкретных ситуациях может быть поулчше.

#table(columns: 8,
	[$epsilon$], [$0$], [$1$], $2$, $dots$, $k$, $dots$, $n$,
	$p$, $q^n$, $n dot p q^(n - 1)$, $C_n^2 p^2 q^(n-2)$, $dots$, $C_n^k p^k q^(n - k)$, $dots$, $p^n$
)


==== Функция распределения:

$ F_(xi/*ва*/) = limits(sum)_(k < x) C_n^k p^k q^(n - k) $

===== Замечание
// ебать равноНезависимо от результата дегустации, надпись "Мёд липовый" всегда соответствует действительности.шек
// все равны но есть равнее
В таком виде:
$
P_n (k) = C^k_n p^k q^(n - k) #[ --- формула Бернулли]
$

Формула Бернулли представляет собой истинную, корректую, верную модель решения задачи, но ею слишком неудобно пользоваться, поэтому на практике используются *предельные теоремы* и *предельные распределения*

=== Распределение /*Па*/Пуассона (Предельные распределения ).

$
epsilon ~ "Pois" (lambda); space lambda = n p // мне в моменте показалось Pas
$

$epsilon$ --- колличество "успехов" в "большом" числе испытаний Бернулли ($n gt.eq 100$)

// HACK:
// - Скажите пожалуйста, какое стихотворение Пушкин посвятил Анне Петровне Керн?
// - Эээ... "Люблю тебя, Петра творенье".

/ Сформулируем *теорему Пуассона*:

_примечание: относится к математическому анализу, но применяется в теории вероятностей_

Пусть ${p_n}^infinity_(n = 1)$ последовательность неотрицательных чисел, такая что $exists limits(lim)_(n -> infinity) n p_n = lambda$ (квазимонотонная последовательность).

Тогда $forall$ фиксированном $k lt.eq n$

$
C_n^k p_n^k (1 - p_n)^(n - k) limits(->)_(n -> infinity) (e^(-lambda) lambda^k)/(k!)
$

Доказательство:

Обозначим $lambda_n = n p_n => p_n = lambda_n/n $

$
C_n^k p_n^k (1 - p_n)^(n - k)  = (n!)/(k! (n - k)!) ((lambda_n)/(n))^k  (1 - (lambda_n)/n)^(n - k) =\
= (lambda_n)^k/(k!) dot underbrace((n - k + 1)/n, arrow.b \ 1)
dot underbrace((n - k + 2)/n, arrow.b \ 1)
dots underbrace((n - 1)/n, arrow.b \ 1)
dot underbrace(n/n, arrow.b \ 1)
underbrace((1 - lambda_n/n)^(-k), arrow.b \ 1)
dot underbrace((1 - lambda_n)^n, epsilon^(- lambda))
limits(->)_(n -> +infinity) (lambda^k)/(k!) dot e^(-lambda)
$

// HACK: Вчера я выяснил, что 20 рыбок-пираний могут полностью обглодать человека за 15 минут. И ещё я потерял работу в бассейне...

Заметим, что $p$ удовлетвор условиям т. Пуассона $p$ из $B i n (n, p)$, то при большиз $n$ верно $p {xi = k}approx (lambda^k epsilon^(-lambda))/(k!), space k = 0, 1, 2, dots$

Давайте убедимся, что сумма вероятностей равна единице:
$
	limits(sum)_(k = 0)^infinity P { sigma = k } = limits(sum)_(k = 0)^infinity frac(lambda^k e^(-lambda), k!) = e^(-lambda) limits(sum)_(k = 0)^infinity frac(lambda^k, k!) = e^(-lambda) dot e^lambda = e^0 = 1
$


Таким образом для $epsilon ~ P o i s (lambda)$; $lambda = n p$ 

Закон распределения $P {epsilon = k} = (lambda^k epsilon^(- lambda)/(k!)); k = 0, 1, dots $

#table(columns: 7,
	$xi$, $0$, $1$, $2$, $dots$, $k$, $dots$,
	$p$, $e^(-lambda)$, $lambda e^(-lambda)$, $(lambda^2 e^(-lambda))/(2!)$, $dots$, $frac(lambda^k e^(-lambda), k!)$, $dots$
)

Функция распределения 

$
F_xi (x) = limits(sum)_(k lt x) = (lambda^k e^(-lambda))/(k!)
$

=== Геометрическое распределение

// HACK: Независимо от результата дегустации, надпись "Мёд липовый" всегда соответствует действительности.

// я выяснил одну из причин отъёба
// вим считает общую историю
// когда я нажимаю u, а ты что-то пишешь, я отменяю твои правки и твой вим ахуевает














