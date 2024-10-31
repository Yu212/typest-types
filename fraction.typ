#let frac(n, m) = {
  if m < 0 {
    n = -n
    m = -m
  }
  let g = calc.gcd(n, m)
  (type: "frac", n: int(n / g), m: int(m / g))
}

#let _is(x) = type(x) == "dictionary" and "type" in x and x.type == "frac"
#let _display(f) = {
  if f.m == 1 {
    $#f.n$
  } else if f.n < 0 {
    $-#(-f.n) / #f.m$
  } else {
    $#f.n / #f.m$
  }
}
#let _neg(f) = frac(-f.n, f.m)
#let _abs(f) = frac(calc.abs(f.n), f.m)
#let _inv(f) = frac(f.m, f.n)
#let _sgn(f) = if f.n < 0 { -1 } else if f.n > 0 { 1 } else { 0 }
#let _add(f1, f2) = frac(f1.n * f2.m + f2.n * f1.m, f1.m * f2.m)
#let _sub(f1, f2) = frac(f1.n * f2.m - f2.n * f1.m, f1.m * f2.m)
#let _mul(f1, f2) = frac(f1.n * f2.n, f1.m * f2.m)
#let _div(f1, f2) = frac(f1.n * f2.m, f1.m * f2.n)
#let _from_int(n) = frac(n, 1)
#let _cmp(f1, f2) = _sgn(_sub(f1, f2))

#let type_frac = (
  name: "frac",
  is: _is,
  display: _display,
  neg: _neg,
  abs: _abs,
  inv: _inv,
  sgn: _sgn,
  add: _add,
  sub: _sub,
  mul: _mul,
  div: _div,
  cmp: _cmp,
  cast: (
    int: _from_int,
  )
)
