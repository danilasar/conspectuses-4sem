${a_n}$ $a_0, a_1, a_2, dots$

== Производящие функции

/ Опр: $a_0, a_1, a_2, dots, a_n, dots$ производящая последовательность чисел. Производящей функцие (ПФ) для эт. последовательности

$
	a_0 + a_1 t + a_2 t^2 + dots + a_n t^n + dots = underbracket(limits(sum)^infinity_(n = 0) a_n t^n, #[открытая форма ПФ])
$

$
	{a_n} space A(t) = limits(sum)^infinity_(n = 0) a_n t^n\
	A(t) space A(0) = a_0
$

=== Пример
$
underbrace(1, a_0), underbrace(0, a_1), underbrace(1, a_2), 1, 1, dots A(t) = 1 + t^2 + t^3 + dots
$

$
1, -1, 1, -1, dots A(t) = 1 - t + t^2 - t^3 = limits(sum)_(n = 0) (- 1)^n t^n
$
/ Опр: Суммой ПФ-ций $A(t) = limits(sum)_(n = 0)^infinity a_n t^n$ и $B(t) = limits(sum)_(n = 0)^infinity b_n t^n$ 

$
C(t) = A(t) + B(t) = c_0 + c_1 t + c_2 t^2 + dots, space #[ где]
$

$
c_0 = a_0 + b_0\
c_1 = a_1 + b_1\
dots dots dots
c_n = a_n + b_n\
$
$
{a_n},
c_0, c_1, c_2, dots
$

// TODO: У Шефа есть мы не успели


/ Опр: Произв. $A(t) = limits(sum)^(infinity)_(n = 0) a_n t^n$ и $B(t) = limits(sum)^(infinity)_(n = 0) b_n t^n$ 

$ C(t) = A(t) dot B(t) = c_0 + c_1 t + dots + c_n t^n + dots = limits(sum)^(infinity)_(n = 0) c_n t^n $

где

$
c_0 = a_0 dot b_0\
c_1 = a_0 dot b_1 + a_1 dot b_0\
c_2 = a_0 dot b_2 + a_1 dot b_1 + a_2 dot b_0\
dots dots dots
c_n = a_0 dot b_n + a_1 b_(n - 1) + a_2 b_(n- 2) + dots + a_n b_0\
dots
$

$
(a_0 + a_1 t + a_2 t^2 + dots) (b_0 + b_1 t + b_2 t^2 + dots) = c_0 + c_1 t + c_2 t^2 + dots
$

=== Пример

$
B(t) = t^m = 0 + 0 dot t + dot + 1 dot t^m + 0 t^(m + 1)\

underbrace(0\, 0\, dots\, 0\,, m) 1, 0, 0, dots
$
$
{a_n} A(t) = a_0 + a_1 t + dots + a_n t^n + dots
$

$
t^m dot A(t) = a_0 t^m + a_1 t^(m + 1) + dots + a_n t^(n + m) + dot =\
= limits(sum)_(n = 0)^infinity a_n t^(n + m) = limits(sum)_(n = m)^infinity a_(n - m) t^n
$
$
t^m dot A(t)\
underbrace(0\, 0\, dots\, 0\,, m) a_0, a_1, a_2, dots
$

$
A(t) dot B(t) = B(t) dot A(t)\
(A(t) dot B(t)) dot C(t) = A(t) dot (B(t) dot C(t))\
A(t) dot (B(t) + C(t)) = A(t) B(t) + A(t) C(t)
$

*Определение*. Пусть $A(t) = a_0 + a_1 t + dots$ и $B(t) = b_0 + b_1 + dots$ при $B(0) = b_0 = 0$

Подстановка $B(t)$ в $A(t)$

$C(t) = A(B(t)) = c_0 + c_1 t + c_2 t^2 + dots$

$
c_0 = a_0\
c_1 = a_1 b_1\
c_2 = a_1 b_2 + a_2 b_1^2
dots dots
$

$
A(B(t)) = a_0 a_1 (b_1 t + b_2 t^2 + dots ) + a_2 (b_1 t + b_2 t^2 + dots )^2 dots 
$

*Пример*. 1. $B(t) =  -t$ space $limits(0)^(b_0), limits(-1)^(b_1), limits(0)^(b_2), 0, 0, dots \
A(t) { a_n }$

// начало примера написано выше


$
A(- t) = a_0 - a_1 t + a_2 t^2 - a_3 t^3 + dots + (-1)^n a_n t^n + dots
= limits(sum)_(n = 0)^infinity (-1)^n a_n t^n$
// сумма есть


2. $B(t) = c t space 0, c, 0, 0, 0, dots \
A(c t) = a_0 + a_1 c t + a_2 c^2 t^2 + dots + a_n c^n t^n + dots = limits(sum)$ // TODO: заебумба
/// бляяяяяяя



/ Опр: $A(t) = a_0 + a_1 t + a_2 t^2 + dots $ и $B(t) = b_0 + b_1 t + b_2 t^2 + dots$ при $B(0) = b_0 != 0$

$ C(t) = (A(t))/(B(t)) = c_0 + c_1 t + dots #[ такую, что выполняется равенство] space underbrace(A(t) = B(t) C(t), #[arrow.b \ a_n = limits(sum)_(k = 0)^n a_k b_(n - k)]) $

$
a_0 = b_0 c_0 -> c_0 = a_0/b_0 \
a_1 = b_0 c_1 + b_1 c_0 -> c_1 = (a_1 - b_1 c_0)/(b_0)\
a_2 = b_0 c_2 + b_1 c_1 + b_2 c_0 -> c_2 = (a_2 - b_1 c_1 - b_2 c_0)/(b_0)\
dots dots\
a_n = b_0 c_n + b_1 c_(n - 1) + b_2 c_(n - 2) + dots + b_n c_0 -> c_n = (a_n - b - c_(n - 1) - b_2 c_(n - 2) - dots - b_n c_0)
$
=== Пример
$
A(t) = 1\
limits(1)^(a_0), 0, 0, dots
$
$
B (t) = 1 - t\
limits(1)^(b_0), limits(- 1)^(b_1), limits(0)^(b_2), 0, dots
$

$ C(t) = underbrace(frac(1, 1 - t), #[закрытая \ форма \ производящей \ фукнции]) = c_0 + c_1 t + c_2 t^2 + dots + c_n t + dots = underbrace(limits(sum)_(n = 0)^infinity c_n t^n, #[открытая \ форма \ производящей \ функции]) $

Какие получаются коэффициенты $c_n$? Давайте их найдём.

$
c_0 = a_0/b_0 = 1
c_1 = (overbrace(a_1, = 0) - overbrace(b_1, = -1) overbrace(c_0, = 1))/underbrace(b_0, = 1) = 1\
c_n = (overbrace(a_n,0) - overbrace(b_1, - 1) overbrace(c_(n - 1), 2) - overbrace(b_2 c_(n - 2) - b_n c_0,0))/(underbrace(b_0, 1)) = 1
$

$
  underbrace(frac(1, 1 - t), #[закр. форма]) = 1 + t + t^2 + dots = underbrace(limits(sum)_(n = 0)^infinity t^n, #[откр. форма])
$

$
  underbrace(frac(1, 1 + t), #[закр. форма]) = 1 - t + t^2 - t^3 + t^4 - dots = underbrace(limits(sum)_(n = 0)^infinity (-1)^n t^n, #[откр. форма])
$

=== Пример

$
(a + b)^n = limits(sum)_(k = 0)^n c_n^k a^(n - k) b^k\
a = 1, space b = t
$

$
(1 + t)^n = c_n^0 + c_n^1 t + c_n^2 t^2 + dots + c_n^n t^n
$

// я потенциально могу потерять звуковую связь: наушники почти сели
// ок
*Теорема* о разложении $1/(1- a x)^m$

$forall n$ натурального имеет место разложение

$
1/(1 - a x)^m = 1 + c_m^1 a x + c_(m + 1)^2 a^2 x^2 + c_(m + 2)^3 a^3 x^3 + dots + c_(m + n - 1)^n a^n x^n + dots // (*)
$



1.
	$ m = 1 $
$
1/(1 - a x) = 1 + a x + a^2 x^2 + a^3 x^3 + dots + a^n x^n + dots
$

$
1 = (1 - a x)(1 + a x + a^2 x^2 + a^3 x^3 + dots + a^n x^n + dots) =\
= (1 + a x + a^2 x^2 + a^3 x^3 + dots + a^n x^n + dots) - a x(1 + a x + a^2 x^2 + a^3 x^3 + dots + a^n x^n + dots)=\
= 1
$

2. (\*) $m lt.eq k space $ $ space 1/(1 - a x) = 1 + a x + a^2 x^2 + a^3 x^3 + dots + a^n x^n + dots$ верно
$
m = k + 1 \
underbrace(frac(1, (1 - a x)^(k + 1)), #[закр. форма]) = underbrace(1 + C_(k + 1)^n a x + C_(k + 2)^2 a^2 x^2 + dots + C_(k + n)^n a^n x^n + dots, #[откр. форма])
$

Мы считаем верным утверждение для $m <= k$ и берём его за предположение индукции, теперь нужно доказать справедливость случая $m = k + 1$.

$
underbracket(1/(1 - a x)^k,#[закрытая форма]) = (1 - a x) dot underbracket(1/(1 - a x)^(k + 1),#[закрытая форма]) #[ верное равенство]
$


// я в эфире
// что куда
// всё успевается?

// практически
// ты меня слышишь?
// да

// ебать я вовремя





