#import "sym.typ": com-key, mac-key

#let _inset = 4pt
#let _radius = 2pt

#let base-fill-color = rgb("#F2F2F2")
#let base-stroke-color = rgb("#828282")
#let base-text-color = rgb("#333333")

#let base-kbd(sym) = box(radius: _radius, inset: _inset, fill: base-fill-color, stroke: base-stroke-color, width: auto, height: auto)[
  #sym
]

#let kbd(..keys, compact: false, delim: "+") = {
  if compact {
    base-kbd(keys.pos().join(delim))
  } else {
    keys.pos().map(k => [#base-kbd(k)]).join([#box(inset: 4pt, delim)])
  }
}