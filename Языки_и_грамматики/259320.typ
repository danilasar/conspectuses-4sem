== Эквивалентнсть --- (3)
- Будем вычислять $delta_N (q, a)$ следующим образом:
Пусть $S = C L (q)$.
$delta_N (q, a)$ еесть объединение $delta_E (p, a)$ по всем $p$ в $S$:
$delta_N (p, a)$ по всем $p$ в $S$:
$ delta_N (p, a) = limits(union.big)_(p in S) delta_E (p, a) $

== Эквивалентнсть --- (4)
- Докказательство индукцией по $|w|$ того, что
$ C L (delta_N (q_0, w)) = delta_E (q_0, w) $

Идея доказательства: НКА на любом входе w переходит в тот же набор состояний, в который переходит эпсилон-НКА на том же входе, используя, где возможно, эпсилон-переходы...

== Пример: от $epsilon$-НКА к НКА


    #table(columns: 4,
    [], [0], [1], [$epsilon$],
    [A], [{E}], [{B}], [$emptyset$],
    [B], [$emptyset$], [{$C$}], [{$D$}],
    [D], [$emptyset$], [$emptyset$], [$emptyset$],
    [E], [{$F$}], [$emptyset$], [${B, C}$],
    [F],[{D}], [$emptyset$], [$emptyset$]
    )  



  #table(columns: 3, 
  [$A$],[${E}$],[${B}$],
  [\* $B$],[$emptyset$],[${C}$],
  [$C$],[$emptyset$],[${D}$],
  [\* $D$],[$emptyset$],[$emptyset$],
  [\* $E$],[${F}$],[${C, D}$],
  [$F$],[${D}$],[$emptyset$],
)


// VIM Mode на VS Code невыносим
// Он пиздец просто лагает
// Мало дефицита кеймапов, из-за фризов писать вообще анрил
 
// бляя как я к виму привык...
// просто на интуиции кеймапы ебашу, а они не работают(

== Заключение

/ Теорема: КДА, НКА и $epsilon$-НКА все принимают в точности одно и то же множестов языков: регулярные языки.
- По этой причине эти языки ещё называют *автоматными*
- Типы НКА проще строить и они могут иметь экспоненциально меньше состояний, чем КДА.
- Но только КДА может быть реалиован!

// нахуя нужен роскомнадзор, если тут замедление клавиатуры от майкрософта фирменное
// ахахахааха


== Эквивалентнсть РВ и конечных автоматов
- *Теорема*. Регулярные выражения и каонечные автоматы представляют один и тот класс регулярных 
- Нужно показать, что для каждого 

= От РВ к $epsilon$-НКА: Базис

// даже вс код отъёбывает....
// скоро мы дойдём до гугл докс...

// Привет ир теперь тот ты лагать не должен я надеюсь йоптель мопсель нахуй бля ну вроде еш лагать стало подлагивает конечно но писать как будто можнои пиши любую лабуду я тестирую скорость пиши Егоришиобл пол 
// у могльнопсатьйн 



Пример построения КА по РВ
- Регулярное выражение: $(a + b) (c + d)$
- 1) Автоматы для РВ $a, b, c, d$
- 2) Автомат для РВ $a + b$
// я не успеваю рисовать за ним
-3) Автомат для РВ cd

== Пример построения КА по РВ
- Регулярное выражение: $(a + b)(c + d)$
- 4) автомат для РВ cd

- Регулярное выражение $(a + b)(c + d)^\*$
- 5) Автомат для РВ $(a + b)((c d)*$

== От-ДКА-к-РВ
- Необычный вид индукции.
- Пусть состояния КДА именуюся 1,2, ..., n 
- Индукция проводится по $k$, максимальному числу состояний, по которым нам позволено проходиь вдоль пути.


== $k$-пути

- $K$-путь --- это путь в графе КДА, который не проходит через состояния с номераи больше, чем $k$
- Выбор конечной вершины не ограничивается ей может быть любое состояние
- $n$-пути являются неограниченными ($n$ --- число состояний автомата)
- РВ есть объединение РВ для $n$-путей от начального состояния к каждому конечному состоянию
// - я ебал, это пиздец, короче самы надежный вариант, это ssh + livecode в виме (будто бы)
// - бляяяяя
// ну не поспоришь
// - какая это все хуйня какой смысл



....

// TODO:

== Промежуточные итоги
- Каждый из рассмотренных трех типов автоматов (КДА, НКА, $epsilon$-НКА), а также регулярные выражения, определяют одно и то же множество языков: регулярные языки
$
  P B -> 
$// TODO:



- Лемма: Если $L = L(A)$ для некоторого конечного автомата $A$, то $L = L(G)$ для некоторой праволинейной грамматики $G$.
- Док-во: Пусть $A = (Q, Sigma, delta, q_0, F)$ - КДА. Определим грамматику $G = (Q, Sigma, P, q_0)$, где $P$ имеет вид:

Если $delta (q, a) = r$ , то $P$ содержит правило $q -> a r$.

Если $p in F$, то $P$ содержит правило $p -> epsilon$.

Каждый шаг вывода в грамматике $G$ имитирует такт работы автомата $A$.

Индукция по $i$ --- длине вывода.


// вообще можем сделать ssh + emacs ибо emacs умеет в бесшовное редактирование одного файла с разных окон
Базис: $i = 0. q => epsilon <=> (q, epsilon) "как-то странный знак" (q, epsilon)$.
IH: $s =>^i x <=> (s, x) "какой-то знак" (r, epsilon)$ для некоторого $r in F$.   

*Шаг индукции*. Пусть $w = a x$, где $|x| = i$.

Тогда $q =>^(i + 1) w$ равносильно тому, что $q => a s =>^i$ a $x$ для некоторого $s$.

Но $q => a s$ равносильно $delta (q, a) = s)$ или $q a |-^1 (s, epsilon)$.

Это означает, что $(q, a x) |-^1 (s, x)$.



По индукции $s =>^i x <=> (s,x)$...


Следовательно, $q =>^(i + 1)$ равносильно (q, a x) |-^1 (s, x) |-^(i - 1) (r, epsilon) или $(q, w) |-^i (r, epsilon)$ для некоторого $r in F$

ч. т. д.


Лемма. Если $L = L(G)$ для некоторой праволинейной грамматики $G$, то $L = L(A)$ для некоторого конечношго автомата $A$.

Док-во. Пусть $G = (Q, Sigma, P, S)$ --- праволинейная грамматика. Построим атвомат $A = (N union {q_f}, Sigma, delta, S, F)$, где $delta$ определено как:




Если $A -> a B in P$, то $delta (A, a) = B$ для $A, B in N$ и $a in Sigma$
Если $A -> a in P$, то $delta (A, a) = q_f$ для $A in N$ и $alpha in Sigma$


$ F = { S, q_f} $, если в $P$ есть $S -> epsilon$ и $F = {q_f}$ --- в противном слуае.

Очевидно, что что построенный автомат   определяет тот же язык, что и исходная праволинейная грамматика

Теорема:
Язык праволинейный $<=>$ он автоматный

Доказательство следует из двух предыдущи лемм.

= Заключение

Каждый из рассмотренных трёх типов автоматов (КДА, НКА, э-НКА), а также регулярные выраения, определяют одно и то же множество языков: регулярные языки.


- Теорема. Утверждения:
  - $L$ -  регулярный язык (регулярное множество),
  - $L$ // TODO:
  
#image("imgs/023.png")

== Свойства регулярный языков
- Класс языков - это множество языков.   
  - Пример: регулярные языки
- Классы языков имеют два вида важных свойств:
 1. Разрешимые Свойства
 2. Свойства замкнутости

// ебануться можно
// гит в реальном времени изобели
// пиздец, и как ? работает?
// ? работает? --- не понимаю синтаксис вопроса)
// два вопроса подряд
// и как?
// работает?

// че? а блять, ну мы и в виме так можем 
// ага
// блять я знаю как можно
// у оверлифа нормальный кооп, надо посмотреть, мб оно как-то нормально написано

== Свойство замкнутости
- Свойство замкнутости класса языков говорит, что выпнение некоторой операции над языками в класс (например, объединение) дает в резульатте язык из того же класса
- Пример: регулярные языки, очевидно, замкнуты относительно 
 - Использовать для доказательства предстваление регулярных языков регулярными выражениями.
 
== Представление языков

 - Представление может быть формальным и неформальным

Пример: (формальный): представление языка РВ или КДА, определяющим соотв. язык


== Почему важны разрешимые свойства?

- Рассмотрим КДА, представляющий некоторый протокол.

Пример: "Завершется ли протокол?" = "Является ли язык конечным?"

Пример: "Может ли протокол быть неверным?" = "Является ли язык непустым?"

- Сделать финальным состоянием "состояние ошибки"

- Нам хотелось бы иметь "наименьшее" представление языка, т. е. КДА с минимальным числом состояний или самое короткое РВ.

- Можем ли мы определить, №Являются ли два языка одним и тем же?"

 - То есть, определяют ли два КДА один и тот же язык?


Проблема принадлежности строки языку
- Нашей первой разрешимой проблемой для регулярных языков будет ответ на вопрос:" находится ли строка $w$ в регулярном языке $L$?"
- Предположим, что $L$ представлен КДА А.
- Смоделируем работу $A$ на последовательных входных символах w.





