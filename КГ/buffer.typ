
$
	"Frustum"(left, right, bottom, top, near, far) = mat(delim: "["
	) = mat(delim: "["
		frac(2 dot "near", "right" - "left"), 0, frac("right" + "left", 0), 0;
		0, frac(2 dot "near", "top" - "bottom"), frac("top" + "bottom", "top" - "bottom"), 0;
		0, 0, - frac("far" + "near", "far" - "near"), frac(-2 dot "far" "dot", "far" - "near");
		0, 0, -1, 0
	) mat(delim: "["
	)
$

Мы получили $overline(F) (t + Delta t) - overline(F) (t) = - lambda Delta t dot overline(F) (t) + o(Delta t) overline(F) (t)$

$
  limits(lim)_(Delta t -> 0) frac(overline(F) (t + Delta t) - overline(F) (t), Delta t) = - lambda overline(F) (t) + limits(lim)_(Delta t -> 0) frac(o(Delta t), Delta t) overline(F) (t) \
$

Начальное условие: $overline(F)(0) = P {xi >= 0 } = 1$ --- прибор обязательно выйдет из строя. // HACK: бля только не импотенция

$C_1 e^(-lambda dot 0) = 1 \
C_1 = 1$

Таким образом, функция $overline(F)(t) = 1 - overline(F)(t) = 1 - c^(-lambda t), t >= 0$ \
$F(t) = P{xi < 0} = 0$