*Определение*. Пусть $A(t) = a_0 + a_1 t + dots$ и $B(t) = b_0 + b_1 + dots$ при $B(0) = b_0 = 0$

Подстановка $B(t)$ в $A(t)$

$C(t) = A(B(t)) = c_0 + c_1 t + c_2 t^2 + dots$

$c_0 = a_0\
c_1 = a_1 b_1 \
c_2 = a_2 b_1^2 \
dots dots dots$

$A(B(t)) = a_0 + a_1 (b_1 t + b_2 t^2 + dots) + a_2 (b_1 t + b_2 t^2 + dots)^2 + dots$

*Пример*. $B(t) =  -t$, $limits(0)^(b_0), limits(-1)^(b_1), limits(0)^(b_2), 0, 0, dots \
A(t) { a_n }$

$A(-t) = a_0 - a_1 t + a_2 t^2 - a_3 t^3 + dots + (-1) a_n t^n + dots
= limits(sum)_(n = 0)^infinity (-1)^n a_n t^n$

2) $B(t) = c t space 0, c, 0, 0, 0, dots \
A(c t) = a_0 + a_1 c t + a_2 c^2 t^2 + dots + a_n c^n t^n + dots = limits(sum)$

*Определение*. $A(t) = a_0 + a_1 $

и $B(t) = b_0 + b_1 t + b_2 t^2 + dots$

$a_1 = b_1 c_1 + b_1 c_0 -> c_1 = frac(a_1 - b_1 c_0, b_0)\ 
a_2 = b_0 c_2 + b_1 c_1 + b_2 c_0 -> c_2 = frac( a_2 - b_1 c_1 - b_2 c_0, b_0), dots \
a_n = b_0 c_n + b_1 c_(n - 1) + b_2 c_(n - 2) + dots + b_n c_0 -> c_n = frac(a_n - b_1 c_(n - 1) - b_2 c_(n - 2) - dots - b_n c_0, b_n)$

*Пример*. $A(t) = 1, limits$

$C(t) = frac(1, 1 - t) = c_0 + c_1 t + c_2 t^2 + dots + c_n t + dots = underbrace(limits(sum)_(n = 0)^infinity c_n t^n, #[открытая \ форма \ производящей \ функции])$

$c_0 = a_0/b_0 = 1 \
c_1 = (overbrace(a_1, 0) - overbrace(b_1, = -1) overbrace(c_0, = 1))/underbrace(b_0, = 1) = 1 \
0 n 2 ? ? ?
1
c_n = frac(a_n - b_1 )$

$underbrace(frac(1, 1 - t), #[закр. форма]) = 1 + t + t^2 + dots = underbrace(limits(sum)_(n = 0)^infinity t^n, #[откр. форма])$

1 = (1 - a x)(1 + a x + a^2 x^2 + dots + )

2. (\*) $m <= k$

frac(1, (1 - a x)^(k + 1)) = 1 + C_(k + 1)^n a x + C_(k + 2)^2 a^2 x^2 + dots + C_(k + n)^n a^n x^n + dots