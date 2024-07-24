#import "@preview/mantys:0.1.4": *
// Vendored because of https://github.com/jneug/typst-mantys/pull/20
#let cmdref(name) = {
  link(cmd-label(name), cmd-(name))
}
// End Vendored

#import "../src/lib.typ"

#let date = datetime(year: 2024, month: 07, day: 02)
#let keyle = package[keyle]

#show: mantys.with(..toml("/typst.toml"), title: [matryoshka], subtitle: [Nested compilers], date: datetime.today(), abstract: [
  This package provides a simple way to style keyboard shortcuts in your documentation.
], examples-scope: (matryoshka: lib))

= keyle

This package provides a simple way to style keyboard shortcuts in your documentation.

== Usage

#codesnippet[```typ
  #import "@preview/keyle.typ:0.0.1": kbd, com-key, mac-key
```]

You can then use the  commands to style your keyboard shortcuts.

== Available Commands



=== Basic

```typ
#kbd("Ctrl")
#kbd("Ctrl", "C")
#kbd(com-key.shift, com-key.alt, "A")
```

#stack(
  dir: ttb,
  spacing: 5pt,
  lib.kbd("Ctrl"),
  lib.kbd("Ctrl", "C"),
  lib.kbd(lib.com-key.shift, lib.com-key.alt, "A"),
)

=== Compact

```typ
#kbd("Ctrl", "A", compact: true)
```

#stack(dir: ttb, spacing: 5pt, lib.kbd("Ctrl", "A", compact: true))

=== Custom Delimiter

```typ
#kbd("Ctrl", "A", compact: true, delim: "-")
#kbd(mac-key.command, "S", compact: true, delim: "")
#kbd(mac-key.shift, mac-key.tab-left, mac-key.escape, compact: true, delim: "")
```

#stack(
  dir: ttb,
  spacing: 5pt,
  lib.kbd("Ctrl", "A", compact: true, delim: "-"),
  lib.kbd(lib.mac-key.command, "S", compact: true, delim: ""),
  lib.kbd(lib.mac-key.shift, lib.mac-key.tab-left, lib.mac-key.escape, compact: true, delim: ""),
)