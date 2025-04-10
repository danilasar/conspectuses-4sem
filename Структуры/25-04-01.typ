

= Вычисление времени выполнения нерекурсивных алгоритмов
== Нахождение функции трудоемкости по фактическому количеству элементарных операций.
В качестве "элементарных" опреаций алгоритма представленного в формальной системе RAM будем использовать следующие:

+ Простое присваивание: $a <- b;$
+ одномерная индексация $a[i]$
+ арифметические операции: $(\*, \/, -, +)$
+ Операции сравнения
+ Логические операции

=== Анализ трудоемкости основанных алгоритмических конструкций
#image("imgs/007.png")
#image("imgs/008.png")
#image("imgs/009.png")
// скрин сюда слайд 2
// и слада 3

==== Примеры анализа простых алгоритмов
===== Пример 1. Задача суммирования элементов квадратной матрицы
Алгоритм выполняет одинаковое количество операций при фиксированном значении $n$, и следовательно является количественно-зависимым.

$ S u m <- 0 $
$ F o r space i space <- 0 t o space n - 1 $
$ F o r space j space <- 0 t o space n - 1 $
$ S u m <- S u m + A[i][j] $
$ e n d space f o r $

$
T_a (n) = 1 + 1 + 3n + n + (1 + 3 n + 4n ) = 7 n^2 + 4n + 2 = Theta (n^2)
$

// Первая единица -- присваивание суммы
// Вторая единица и 3n --- это присваивание i, а также операция сравнения, расчёта нового значения i, присваивание i
// n * () --- количество запусков внутреннего цикла
// 1 + 3n + 4n --- операции внутреннего цикла, 4n --- обращение к A[i][j], прибавление к sum, присвоение нового значения sum
===== Пример 2. Задача поиска максимума в массиве
Данный алгоритм является порядкого-зависимым, поэтому для фиксированной размерности исходных данных необходимо проводить анализ для худшего, лучшего и среднего случая.

```
Max <- S[0]
For i <- 1  to n - 1
		if Max < S[i]
				then Max <- S[i]
end for
```

*Худший случай*
Максимальное количество переприсваиваний максимума (на каждом проходе цикла) будет в том случае, если элементы массива отсортированы по возрастанию. Трудоемкость алгоритма в этом случае равна:
$
T_a \^ (n) = 2 + 1 + 3 (n - 1) + (n - 1) (2 + 2) = 7 n - 4
$

*Лучший случай*
Минимальное количество переприсваивания максимума будет в том случае, если максимальный элемент рпсположен на первом месте в массиве. Трудоемкость алгоритма в этом случае равна

$
T_a^arrowhead.b (n) = 2 + 1 + 3 (n - 1) + 2(n - 1)= 5 n - 2
$


// 6 слайд:

*Средний случай*

/ Элементраное усреднение:
$ T_"ср" (n) = (T_a^or (n) + T_A^and (n))/2 = 6n - 3 $

/ Вероятностный подход:

- Переприсваивание максимума при просмотре $k$-го элемента происходит, если в подмассиве из первых к элементов максимальным элементом является последний. В случае равномерного распределения вероятность этого равна $1/k$. Тогда в массиве из $n$ элементов математическое ожидание среднего количества операций присваивания определяется как:

$ limits(sum)_(k = 1)^N 1/k = H n approx ln(N) + gamma, gamma approx 0,057, " где " gamma #[ --- постоянная Эйлера]  $

$ gamma = limits(lim)_(n -> infinity) (limits(sum)_(k = 1)^n - ln n) = limits(lim)_(n -> infinity) (1 + 1/2 + 1/3 + dots + 1/n - ln n) $

Величина $H_n$ называется $n$-ым гармоническим числом.

$ overline(T)_a (n) = 2 + 1 + 3(n - 1) + 2(n - 1) + 2(ln n + gamma)) = 5 n - 2 + 2 ln n + 2 gamma $


// 7 слайд:

=== Некоторые математические формулы, необходимые для анализа алгоритмов
== Логарифмы. Фомрулы суммиования.

#grid(columns: 2,
$log_B 1 = 0$, $limits(sum)_(i = 1)^N C_i = C limits(sum)_(i = 1)^N i$,
$log_B B = 1$, $limits(sum)_(i = L)^N i = limits(sum)_(i = 0)^(N - L) (i + L)$,
$log_B (X Y) = log_B X + log_B Y$, $limits(sum)_(i = L)^N i = limits(sum)_(i = 0)^N i- limits(sum)_(i = 0)^(L - 1) i$,
$log_B X^Y = Y log_B X$, $limits(sum)_(i = 1)^N (A + B) = limits(sum)_(i = 1)^N A + limits(sum)_(i = 1)^N B$,
$log_A X = (log_B X)/(log_B A)$, $limits(sum)_(i = 0)^N (N - i) = limits(sum)_(i = 0)^N i$,
$A^(log_B C) = C^(log_B A)$,
$log_A B = 1/(log_B A)$,
)

// Слайд 8
$
limits(sum)_(i = 1)^N 1 = N\

limits(sum)_(i = 1)^N C = C N\

limits(sum)_(i = 1)^N i = (N (N + 1))/(2)\

limits(sum)_(i = 1)^N A^i = (A^(N + 1) - 1)/(A - 1) space forall A, #[где A число]\
limits(sum)_(i = 1)^N i 2^i = (N - 1) 2^(N + 1) + 2\
limits(sum)_(i = 1)^N 1/i approx ln N \
limits(sum)_(i = 1)^N log_2 i approx N log_2 N - 1.5 \
$

// Слайд 9:

=== Математическое ожидание дискретной случайной величины.
Если изветсен закон распределения случайной величины $x$, то есть известно, что случайная величина $x$ может принимать значения $x_1, x_2, dots, x_k$ с вероятностями $p_1, p_2, dots, p_k$, тогда математическое ождание $M_x$ случайной величины $x$равно

$
M_x = limits(sum)_(i = 1)^k p_i x_i
$

Если случайная величина $x$ имеет дискретное равномерное распределение:

$
P(x = x_i) = 1/n, space i = 1, dots, n
$

то ее математическое ожидание равно $M_x = 1/n limits(sum)_(i = 1)^n x_i$

==== Свойства математического ожидания:
- Математическое ожидание постонной равно жтой постоянной $M_c = C$
- Математическое ожидание суммы случайных величин равно сумме их математических ожданий: $M_(x + y) = M_x + M_y$
- Математическое ожидание произведения независимых ожиданий этих величин: $ M_(x * y) = M_x * M_y$

// Слайд 10:

*Средний случай*

/ Элементраное усреднение:
$ T_"ср" (n) = (T_a^or (n) + T_A^and (n))/2 = 6n - 3 $

/ Вероятностный подход:

- Переприсваивание максимума при просмотре $k$-го элемента происходит, если в подмассиве из первых к элементов максимальным элементом является последний. В случае равномерного распределения вероятность этого равна $1/k$. Тогда в массиве из $n$ элементов математическое ожидание среднего количества операций присваивания определяется как:

$ limits(sum)_(k = 1)^N 1/k = H n approx ln(N) + gamma, gamma approx 0,057, " где " gamma #[ --- постоянная Эйлера]  $

$ gamma = limits(lim)_(n -> infinity) (limits(sum)_(k = 1)^n - ln n) = limits(lim)_(n -> infinity) (1 + 1/2 + 1/3 + dots + 1/n - ln n) $

Величина $H_n$ называется $n$-ым гармоническим числом.

$ overline(T)_a (n) = 2 + 1 + 3(n - 1) + 2(n - 1) + 2(ln n + gamma)) = 5 n - 2 + 2 ln n + 2 gamma $


#grid(columns: 2,
$log_B 1 = 0$, $limits(sum)_(i = 1)^N C_i = C limits(sum)_(i = 1)^N i$,
$log_B B = 1$, $limits(sum)_(i = L)^N i = limits(sum)_(i = 0)^(N - L) (i + L)$,
$log_B (X Y) = log_B X + log_B Y$, $limits(sum)_(i = L)^N i = limits(sum)_(i = 0)^N i- limits(sum)_(i = 0)^(L - 1) i$,
$log_B X^Y = Y log_B X$, $limits(sum)_(i = 1)^N (A + B) = limits(sum)_(i = 1)^N A + limits(sum)_(i = 1)^N B$,
$log_A X = (log_B X)/(log_B A)$, $limits(sum)_(i = 0)^N (N - i) = limits(sum)_(i = 0)^N i$,
$A^(log_B C) = C^(log_B A)$,
$log_A B = 1/(log_B A)$,
)

Очень пригодится в области анализа алгоритмов умение распознавать два основных класса формул суммирования:
- *Арифметические прогрессии*. Арифметическую прогрессию в виде формулы $S(n) = limits(sum)_i^n i = n (n + 1)/2$ можно встретить в анализе алгоритма сортировки методом выбора. По большому счёту, важным фактом являеется наличие квадратичной суммы, а не то, что константа равняется $1/2$. В общем, для $p >= 1$:

$ S(n, p) = limits(sum)_i^n i^p = Theta (n^(p + 1)) $

Для $p < -1$ эта сумма всегда стремится к константе, даже когда $n -> infinity$.

- *Геометрическая прогрессия*. В геометрических прогрессиях индекс цикла играет роль показателя степени, то есть:

$ G(n, a) = limits(sum_(i = 0)^n) a' = a(a^(n + 1) - 1)/(a - 1) $

Сумма прогрессии зависит от её знаменателя, то есть числа $a$. При $a < 1$ эта сумма стремится к константе, даже когда $n -> infinity$.

// Слайд 11:
== Нахождение вида функции трудоёмксоти без подсчёта фактической стоимости команд

*Пример анализа сортировки вставкми*:

#table(columns: 3,
    table.header([*Сортировка вставками*], [*Стоимость*], [*Количество повторений*]),
    table.cell(rowspan: 9, ```cpp
    for(i = 1; i < n; ++i) {
        x = a[i];
        j = i - 1;
        while(j >= 0 && a[j] > x) {
            a[j + 1] = a[j];
            j--;
        }
        a[j + 1] = x;
    }
    ```),
    $c_1$,$c_2$,$c_3$,$c_4$,$c_5$,$c_6$,[],$c_7$,$c_8$,
    $n$, $n -1$, $n-1$, $limits(sum)_(i = 1)^(n -1) t_i$, table.cell(rowspan:2, $limits(sum)_(i = 1)^(n - 1) (t_i - 1)$), [], $n - 1$
)

где $t_i$ --- количество повторений цикла ```cpp while```.

Время работы алгоритма сортировки вставками --- это сумма времён работы каждого шага.

$ T(n) = c_1 n + c_2 (n - 1) + c_3 (n - 1) + c_4 limits(sum)_(i = 1)^(n - 1) t_i + c_5 limits(sum)_(i = 1)^(n - 1) (t_i - 1) + c_6 limits(sum)_(i = 1)^(n - 1) (t_i - 1) + c_7 (n - 1) $

// Слайд 12

=== Анализ наилучшего случая.
На вход подается уже отсортированный массив. При этом все внутренние циклы состоят всего из одной итерации, то есть $t_i = 1$ для всех $i$ю Тогда время работы алгоритма составит:
$
T(n) = c_1 n + c_2 (n - 1) + c_3 (n - 1) + c_4 (n - 1) + c_7 (n - 1) =\
= (c_1 + c_2 + c_3 + c_4 + c_7)n - (c_2 + c_3 + c_4 + c_7)
$

Таким образом, в лучшем случае время $T(n)$, необходимое для сортировки массива размера $n$, является линейной функцией от $n$ и имеет вид $T(n) = a n + b$ для некоторых констант $a$ и $b$.

// Слайд 13
// 
=== Анализ наихудшего случая
Входной массив, отсортирован в обратном порядке. При этом каждый $a[i]$ элемент сравнивается со всеми уже отсортированными элементами $a[0]dots a[i - 1]$. Это означает, что все внутренние циклы состоянт из $i$ итераций, то есть $t_i = i$ для всех $i$. Тогда время работы алгоритма составит:

$
limits(sum)_(i = 1)^(n - 1) i = (n (n - 1))/2\
limits(sum)_(i = 1)^(n - 1) (i - 1) = (n (n - 3))/2 + 1\

T(n) = c_1 n + c_2 (n - 1) + c_3 (n - 1) + c_4 ((n (n - 1))/2) + c_5 ((n (n - 3))/2 + 1) +\
+ c_6 ((n (n - 3))/2 + 1) + c_7 (n - 1) = (c_4 / 2 + c_5 / 2 + c_6 / 2) n^2 +\
+ (c_1 + c_2 + c_3 - c_4 / 2 - 3c_5 / 2 - 3 c_6 / 2 + c_7) n - (c_2 + c_3 - c_5 - c_6 + c_7) 
$

Тепереь функция $T(n)$ квадратичная и имеет вид $T(n) = a n^2 + b n + c$

// Слайд 14
=== Анализ среднего случая
Характер поведения усреднённого времени работы часто ничем не лучше поведения времени работы для наихудшего случая. Предположим, что последовательность, к которой применяется сортировка методом вставок, сформирована случайным образом. Сколько времени понадобится, чтобы определить, в какое место подмассива ```cpp a[0..i-1]``` следует поместить элемент ```cpp a[i]```? Предположим, что в среднем половина элементов этого подмассива меньше, чем ```cpp a[i]```, а половина — больше его. Таким образом, в среднем нужно проверить половину элементов подмассива ```cpp a[0..i-1]```, поэтому $t_i approx i/2$.


В результате получается, что среднее время работы алгоритма является квадратичной функицей от количества входных элементов, то есть характер этой зависимоститакой же, как и для времени работы в наихудшем случае.

Для облегченияанализа алгоритма были сделаны некоторые упрощения. Было проигнориорвоано фактическое время выподлнения каждой инструкции. Эта величина была представлена в виде некоторой константы $c_i$. Далее эти константы также были обобщены и время работы алгоритма выражается просто формулой: $a n^2 + b n + c$, где $a$, $b$ и $c$ --- некоторые константы, зависящие от стоимостей $c_i$.

Таким образом, игнорируются не только фактические стоимости команд, но и их абстрактные стоимости $c_i$.

// Слайд 16:
== Правила вычисления времени выполнения программ
=== Правило 1. Правило сумм

Пусть $T_1 (n)$ и $T_2 (n)$ --- время выполнения двух последовательных фрагментов просграммы $P_1$ и $P_2$ соответственно. Пусть $T_1 (n) = O (f(n))$, $T_2 (n) = O (g(n))$. Тогда $T_1 (n) + T_2 (n) = O (m a x(f(n), g(n))).$

*Доказательство:*

$T_1 (n) = O (f(n))$, следовательно, существуют такая константа $c_1$ и натуралное число $n_1$, что $T_1 (n) lt.eq c_1 f(n)$ для любого $n gt.eq n_1$

$T_2 (n) = O (g(n))$, следовательно, существуют такая константа $c_2$ и натуралное число $n_2$, что $T_2 (n) lt.eq c_2 g(n)$ для любого $n gt.eq n_2$

Пусть $n_0 m a x (n_1, n_2)$. Если $n gt.eq n_0$ то очевидно, что
$
T_1 (n) + T_2 (n) lt.eq c_1 dot f (n) + c_2 dot g(n) =>\
=> T_1 (n) + T_2 (n) lt.eq (c_1 + c_2) dot m a x(f (n), g(n)) =>\
=> T_1 (n) + T_2 (n) lt.eq c dot m a x(f (n), g(n)) =>\
=> T_1 (n) + T_2 (n) lt.eq O(m a x(f (n), g(n)))
$

*Следствие* Из правила сумм также следует, что если $f(n) lt g(n)$ для всех $n$ превышающих $n_0$, то выражение $O(f(n) + g(n))$ эквивалентно $O(g(n))$ например, $O(n^2 + n)$, то же самое, что $O(n^2)$

// Слайд 17:
=== Правило 2. Правило произведений.

усть $T_1 (n)$ и $T_2 (n)$ --- время выполнения двух вложенных фрагментов программы $P_1$ и $P_2$ соответственно. Пусть $T_1 (n) = O(f(n))$, $T_2 (n) = O(g(n))$. Тогда $T_1 (n) dot T_2 (n) = O(f(n) dot g(n))$.

*Доказательство*:

$T_1 (n) = O(f(n)) => exists c_1 eq.triple "const", n_1 in NN space space forall n >= n_1 space T_1 (n) <= c_1 dot f(n)$

$T_2 (n) = O(g(n)) => exists c_2 eq.triple "const", n_1 in NN space space forall n >= n_2 space T_2 (n) <= c_2 dot g(n)$

Пусть $n_0 = max(n_1, n_2)$. Если $n >= n_0$, то очевидно:

$T_1 (n) dot T_2 (n) <= c_1 dot f(n) dot c_2 g(n) => T_1 (n) dot T_2 (n) <= (c_1 dot c_2) dot (f(n) dot g(n)) $

*Следствие*:

$O(c dot f(n)) approx O(f(n))$, если $c > 0$.

$O((n^2)/2) = O(n^2)$, то есть постоянным множителем, в силу правила произведений, можно пренебречь.

// Слайд 18:
=== Правило 3.
Время выполнения операторов присваивания, чтения, записи, сравнения обычно пропорционально единице, т.е. равно $O(1)$

=== Правило 4.
Время выполнения последовательности опрераторов определяется с помощью правила сумм, следовательно, равно наибольшему времени выполнения оператора в данной последовательности

=== Правило 5.
Время выполнения условных операторов состоит из времени условно исполняемых операторов и времени вычисления самого логического выражения, т.е. $O(i f - t h e n - e l s e) = O (i f) + O(m a x (t h e n, space e l s e))$.

=== Правило 6.
Время выполнения цикла является суммой времени всех исполняемых итераций цикла. Часто времявыполнения цикла вычисляется пренебрегая определением кнстант пропорциональности, как произведение количества выполненных итераций цикла на наибольшее возможное время выполнения операторов тела цикла.

// Слайд 19:
=== Правило 7.

Для программ, содержащих несколько нерекурсивных процедур, можно подсчитать общее время выполнения программы путём последовательного нахождения времени выполнения процедур, начиная с той, которая не имеет вызовов других процедур.

_Так как мы предположили, что все процедуры нерекурсивные, то должна существовать хоят бы одна такая процедура._

Затем можно определить время выполнения процедур, вызывающих эту процедуру, используя уже вычисленное время выполнения вызываемой процедуры. Продолжая этот процесс, найдём время выполнения всех процедур.

*Для рекурсивных процедур действуют иные правила.*


// Слайд 20:
#image("imgs/010.png")

// Слайд 21:
=== Анализ алгоритма сортировки вставками

#table(columns: 3,
    table.header([*Сортировка вставками*], [*Стоимость*], [*Количество повторений*]),
    table.cell(rowspan: 9, ```cpp
    for(i = 1; i < n; ++i) {
        x = a[i];
        j = i - 1;
        while(j >= 0 && a[j] > x) {
            a[j + 1] = a[j];
            j--;
        }
        a[j + 1] = x;
    }
    ```),
    $c_1$,$c_2$,$c_3$,$c_4$,$c_5$,$c_6$,[],$c_7$,$c_8$,
    $n$, $1$, $1$, $i$, $1$, $1$,[], $1$
)

Наибольшее количество работы алгоритм произведёт, когда всякий новый элемент добавляется в начало отсортированного списка. Такое возможно только если элементы исходного списка идут в убывающем порядке. В этмо случае $i$й вставлемый элемент сравнивается с $i$ предыдущими, и этот процесс повторяется $n - 1$ раз. Таким, образом, операторы в строках 5-6 имеют порядок $O(1)$ (правило сложения), внутренний цикл ```cpp while``` выполняется $i$ раз, поэтому, по правилу произведений, общее время выполнения этого цикла имеет порядок $O(i) dot 1$, что равно $O(i)$. Для операторов внутри цикла ```cpp for``` время выполнения на каждой итерации этого внешнего цикла ```cpp for``` определяется по правилу суммы $O(max(1, 1, i, 1)) = O(i)$.

Цикл выполняется $n - 1$ раз, поэтому суммарное время выполнения программы ограничено сверху выражением $limits(sum)_(i = 1)^(n - 1) i  = (n(n - 1))/2 = (n^2)/2 - n/2$, которое имеет порядок $O(n^2)$.

// Слайд 22:

=== Лучший случай.
В лучшем случае все элементы уже стоят на своих местах (массив уже отсортирован). и все внутренние циклы состоят всего из одной итерации и имеют порядок $O(1)$. Для операторов (2)-(7) время выполнения на каждой итерации внешнего цикала (1) определеяется по правилу суммы $O(m a x(1, 1, 1, 1)) = O(1)$. Внешний цикл выплняется $N - 1$ раз, следовательно, суммарное время выполнения будет $O(n - 1)$ или окончательно $O(n)$

// Слайд 23:
=== Среднее время выполнения 
В основе *вероятностного анализа* лежит определение различных групп, на которые следует разбить возможные входные наборы данных.

На втором шаге определяется вероятность, с котрой входной набор данных принадлежит каждой группе. Таким образом, необходимо располагать знаниями (или сделать предположение)


// Слайд 24

Анализ среднего случая для сортировки вставками разобьём на два этапа. Сначала подсчитаем среднее число сравнений, необходимое для определения положения очередного элеметна. Затем подсчитаем среднее число всех необходимых операций, воспользовавшись результатом первого шага.

Начнём с подсчёта среднего числа сравнений, необходимых для определения местоположения $i$го элемента. $i$й добавляемый элемент может занимать одно из $i + 1$ возможных положений (1-й элемент либо 0ю, либ 1ю, 2й 0ю, 1ю или 2ю и т. д.). Предполагая случайные входные данные, новый элемент равновероятно элемент может оказатьься в любой позиции. Добавление $i$го элемента к списку требует по крайней мере одного сравнения даже если элемент уже стоит на нужном месте. Для того, чтобы элемент перешёл на одну позицию влево, потреубется уже два сравнения (первое истинно, второе ложно). Передвежение на две позиции влево потребует трёх сравнений (первое истинно, второе истинно, третье ложно) и т. д. Это означает, что для $i$го элемента, попадающего на позиции $i, i-1, dots, 2, 1$ число сравнений будет равно соответственно $1, 2, 3, dots, i - 1, i$, а при попадании на нулевую позицию число сравнений равно $i$, значит среднее число сравнений для вставки $i$го элемента:

$A_i = 1/(i + 1) (limits(sum)_(p = 1)^i) p  + i) = 1/(i + 1) ((i (i + 1))/2 + i) = i/2 + i/(i + 1) = i/2 + 1 - 1/(i + 1)$.

Теперь необходимо просуммировать эти результаты для каждого из $n - 1$ элементов списка:

$ A(N) = limits(sum)_(i = 1)^(N - 1) A_i = limits(sum)_(i = 1)^(N - 1) (i/2 + 1 - 1/(i + 1)) $

$ A(N) = limits(sum)_(i = 1)^N i/2 + limits(sum)_(i = 1)^(N - 1) 1 - limits(sum)_(i = 1)^(N - 1) 1/(i + 1) $

$ limits(sum)_(i = 1)^(N - 1) 1/(i + 1) = limits(sum)_(i = 2) 1/i = limits(sum)_(i = 1)^N 1/i - 1 $

$ A(N) approx 1/2 ((N - 1) N)/2 + (N - 1) - (ln N - 1) $

$ A(N) = O(N^2) $

Как правило, околол 90% времени работы программы требует выполнение повторений и только 10% составляют непосредственно вычисления. Анализ сложности программ показывает, на какие фрагменты выпадают эти 90% --- это циклы наибольшей глубины вложенности. Повторения могут быть организованы в виде вложенных циклов или вложенной рекунрсии.

Эта информация может использоваться программистом для построения более эффективной программы следующим образом. Прежде всего можно попытаться сократить глубину вложенности повторений. Затем следует рассмотреть возможность сокращения количетсва операторов в циклах с наибольшей глубиной вложенности.