#let _is(n) = type(n) == "integer"
#let _display(n) = $#n$
#let _neg(n) = -n
#let _abs(n) = calc.abs(n)
#let _add(n1, n2) = n1 + n2
#let _sub(n1, n2) = n1 - n2
#let _mul(n1, n2) = n1 * n2
#let _div(n1, n2) = frac(n1, n2)
#let type_int = (
  name: "int",
  is: _is,
  display: _display,
  neg: _neg,
  abs: _abs,
  add: _add,
  sub: _sub,
  mul: _mul,
  div: _div,
  cast: (:)
)
