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
  text(fill: black, sym),
))

#let kbd-deep-blue-style(sym) = box(rect(
  inset: (x: _inset),
  outset: (top: _outset),
  stroke: rgb("#2a6596"),
  radius: _radius,
  fill: rgb("#4682b4"),
  smallcaps(text(fill: white, sym)),
))

#let kbd-type-writer-style(sym) = box(
  rect(inset: (x: _inset), stroke: rgb("#2b2b2b"), radius: 50%, fill: rgb("#333"), smallcaps(text(fill: white, sym))),
)

#let kbd-style-funcs = (standard: kbd-stardard-style, deep-blue: kbd-deep-blue-style, type-writer: kbd-type-writer-style)
#let kbd-styles = (standard: "standard", deep-blue: "deep-blue", type-writer: "type-writer")
#let kbd-state = state("kbd-style-state", kbd-styles.standard)

#let kbd-set-style(s) = {
  kbd-state.update(s)
}

#let kbd(..keys, compact: false, delim: "+") = {
  locate(loc => {
    let style-str = kbd-state.at(loc)
    let style-func = kbd-style-funcs.at(style-str)
    if compact {
      style-func(keys.pos().join(delim))
    } else {
      keys.pos().map(k => [#style-func(k)]).join([ #box(height: 1.2em, delim) ])
    }
  })
}

#let kbd-example = [
  #kbd[2] #kbd[3] #kbd[4] #kbd[5] #kbd[6] #kbd[7] #kbd[8] #kbd[9] #kbd[0]\
  #kbd[Q] #kbd[W] #kbd[E] #kbd[R] #kbd[T] #kbd[Y] #kbd[U] #kbd[I] #kbd[O] #kbd[P]\
  #h(1em) #kbd[A] #kbd[S] #kbd[D] #kbd[F] #kbd[G] #kbd[H] #kbd[J] #kbd[K] #kbd[L]\
  #h(2em) #kbd[Z] #kbd[X] #kbd[C] #kbd[V] #kbd[B] #kbd[N] #kbd[M]
]