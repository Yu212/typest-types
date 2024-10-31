#import "fraction.typ": frac, type_frac
#import "int.typ": type_int

#let types = (
  type_int, type_frac
)
#let vtable(x) = types.find(table => (table.is)(x))
#let upcast(x, y) = {
  let vx = vtable(x)
  let vy = vtable(y)
  if (vx.name == vy.name) {
    return (x, y)
  }
  let cast_y2x = vx.cast.pairs().find(pair => pair.at(0) == vy.name)
  let cast_x2y = vy.cast.pairs().find(pair => pair.at(0) == vx.name)
  assert((cast_x2y == none) != (cast_y2x == none), message: "cannot cast")
  if cast_x2y != none {
    return (cast_x2y.at(1)(x), y)
  } else {
    return (x, cast_y2x.at(1)(x))
  }
}
#let display(x) = (vtable(x).display)(x)
#let neg(x) = (vtable(x).neg)(x)
#let abs(x) = (vtable(x).abs)(x)
#let add(x, y) = {
  (x, y) = upcast(x, y)
  (vtable(x).add)(x, y)
}
#let sub(x, y) = {
  (x, y) = upcast(x, y)
  (vtable(x).sub)(x, y)
}
#let mul(x, y) = {
  (x, y) = upcast(x, y)
  (vtable(x).mul)(x, y)
}
#let div(x, y) = {
  (x, y) = upcast(x, y)
  (vtable(x).div)(x, y)
}
