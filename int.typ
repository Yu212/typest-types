#let _is(n) = type(n) == "integer"
#let _display(n) = $#n$
#let _neg(n) = -n
#let _abs(n) = calc.abs(n)
#let _inv(n) = frac(1, n)
#let _sgn(n) = if n < 0 { -1 } else if n > 0 { 1 } else { 0 }
#let _add(n1, n2) = n1 + n2
#let _sub(n1, n2) = n1 - n2
#let _mul(n1, n2) = n1 * n2
#let _div(n1, n2) = frac(n1, n2)
#let _cmp(n1, n2) = _sgn(n1 - n2)
#let type_int = (
  name: "int",
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
  cast: (:)
)
