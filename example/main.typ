#import "../src/lib.typ": kbd, com-key, mac-key, kbd-styles, kbd-set-style, kbd-example

#set page(paper: "a5", margin: 1cm)

= keyle

This package provides a simple way to style keyboard shortcuts in your documentation.

```typ
#import "@preview/keyle.typ:0.0.2": kbd, com-key, mac-key, kbd-style
```

== Usage

=== Basic

```typ
#kbd("Ctrl")
#kbd("Ctrl", "C")
#kbd(com-key.shift, com-key.alt, "A")
```

#stack(dir: ttb, spacing: 5pt, kbd("Ctrl"), kbd("Ctrl", "C"), kbd(com-key.shift, com-key.alt, "A"))

=== Compact

```typ
#kbd("Ctrl", "A", compact: true)
```

#stack(dir: ttb, spacing: 5pt, kbd("Ctrl", "A", compact: true))

=== Custom Delimiter

```typ
#kbd("Ctrl", "A", compact: true, delim: "-")
#kbd(mac-key.command, "S", compact: true, delim: "")
#kbd(mac-key.shift, mac-key.tab-left, mac-key.escape, compact: true, delim: "")
```

#stack(
  dir: ttb,
  spacing: 5pt,
  kbd("Ctrl", "A", compact: true, delim: "-"),
  kbd(mac-key.command, "S", compact: true, delim: ""),
  kbd(mac-key.shift, mac-key.tab-left, mac-key.escape, compact: true, delim: ""),
)

=== Custom Style

```typ
#kbd-set-style(kbd-styles.deep-blue)
#kbd("Ctrl", "A")
```

#kbd-set-style(kbd-styles.deep-blue)
#stack(dir: ttb, spacing: 5pt, kbd("Ctrl", "A"))

```typ
#kbd-set-style(kbd-styles.type-writer)
#kbd("Ctrl", "A")
```

#kbd-set-style(kbd-styles.type-writer)
#stack(dir: ttb, spacing: 5pt, kbd("Ctrl", "A"))

#kbd-example