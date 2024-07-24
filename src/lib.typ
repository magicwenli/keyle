#import "sym.typ": com-key, mac-key

#let _inset = 4pt
#let _outset = 2pt
#let _radius = 3pt

#let kbd-stardard-style(sym) = box(rect(
  inset: (x: _inset),
  outset: (top: _outset),
  stroke: rgb("#555"),
  radius: _radius,
  fill: rgb("#eee"),
  smallcaps(text(fill: black, sym)),
))

#let kbd-deep-blue-style(sym) = box(rect(
  inset: (x: _inset),
  outset: (top: _outset),
  stroke: rgb("#2a6596"),
  radius: _radius,
  fill: rgb("#4682b4"),
  smallcaps(text(fill: white, sym)),
))

#let kbd-style = (standard: kbd-stardard-style, deep-blue: kbd-deep-blue-style)



#let kbd(..keys, compact: false, delim: "+", style: kbd-style.standard) = {
  if compact {
    style(keys.pos().join(delim))
  } else {
    keys.pos().map(k => [#style(k)]).join([ #box(height: 1em, delim) ])
  }
}