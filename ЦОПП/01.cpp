#include <bits/stdc++.h>

using namespace std;


bool operator<(const vec2d& a, const vec2d& b) {
	if(a.x != b.x) return a.x < b.x;
	return a.y < b.y;
}

void add(Vector<vec2d> v, vec2d p, bool upper) {
	// У нас есть вектор точек и мы добавляем в него какую-то точку p.
	// Нам нужно проверить и выкинуть предыдущие точки, если они плохие.
	// При этом, если в огибающем множестве меньше двух точек, то нам и выкидывать-то нечего.
	while(v.size() >= 2) {
		// Взяли последнюю и предпоследнюю точки
		auto last = v.back();
		auto prelast = v[v.size() - 2];
		// Для верхнего огибающего нам нужно проверить,что наша верхняя точка p выкидывает точку last
		vec2d lastp = p - last;
		vec2d prelastp = p - prelast;
		long long prod = prelastp % lastp; // % - оператор псевдоскалярного произведения, он не коммутативен
		// в зависимости от того, в какой мы огибающей и выше или ниже предыдущая точка, принимаем решение
		if((upper && prod >= 0) || (!upper && prod <= 0)) {
			// либо удаляем предыдущую точку, если она делает нашу фигуру выпуклой
			v.pop_back();
		} else {
			// либо останавливаем цикл
			break;
		}
		// вставляем точку
		v.push_back(p);
	}
}

vector<vec2d> convex_hull(vector<vec2d> points) {
	sort(points.begin(), points.end());
	vec2d A = points[0];
	vec2d B = points.back();
	vector<vec2d> upper = { A }; // верхняя огибающая
	vector<vec2d> lower = { A }; // нижняя огибающая
	for(int i = 1; i < points.size(); ++i) {
		// в целом мы можем добавить каждую точку в обе огибающие, ведь
		// алгритм всё равно выкинет ненужные точки --- зачем дважды выполнять одну работу?
		add(upper, points[i], true);
		add(lower, points[i], false);
	}
	// осталось спаять огибающие в один многоугольник
	// удалим лишние точки в lower
	lower.pop_back();
	lower.erase(lower.begin());
	// обратим внимание, что в верхнем огибающем точки идут по часовой, а в нижнем --- против
	// это не окей, ревёрснем нижнюю огибающую
	reverse(lower.begin(), lower.end());
}


int main() {
	cout << setprecision(9) << fixed;
	int n;
	cin >> n;
	vector<vec2d> polygon(n);
	for(int i = 0; i < n; ++i) cin >> polygon[u].x >> polygon[i].y;
	polygon = convex_hull(polygon);
	cout << polygon.size() << '\n';
	for(vec2d point : polygon) cout << point.x << ' ' << point.y << '\n';
}
