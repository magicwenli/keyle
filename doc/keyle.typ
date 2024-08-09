#import "@preview/mantys:0.1.4": *
// Vendored because of https://github.com/jneug/typst-mantys/pull/20
#let cmdref(name) = {
  link(cmd-label(name), cmd-(name))
}
// End Vendored

#import "../src/keyle.typ"

#let lib-name = package[keyle]

#show: mantys.with(..toml("../typst.toml"), date: datetime.today(), examples-scope: (keyle: keyle))
#show link: underline

// end of preamble

= About

#lib-name is a library that allows you to create HTML `<kbd>` like keyboard shorts simple and easy.

The name, `keyle`, is a combination of `key` and `style`.

This project is inspired by #link("http://github.com/auth0/kbd")[auth0/kbd] and #link("https://github.com/dogezen/badgery")[dogezen/badgery].
Send them respect!

= Usage

== Importing

#lib-name is imported using
#codesnippet[```typ
    #import "@preview/keyle:0.1.0"
  ```]

Basic usage is as follows, see #cmdref("kbd") for more details.

== Styles

=== Built-in Styles

Use `kbd-styles` to get available styles.

#grid(columns: (2fr, 1fr), rows: 2em,align: horizon, ..keyle.kbd-styles.pairs().map(item => (
    raw(lang: "typst", "#keyle.kbd-set-style(keyle.kbd-styles." + item.at(0) + ")"),
    [
      #keyle.kbd-set-style(item.at(1)) #keyle.kbd("Capslock")
    ],
  )).flatten())

#keyle.kbd-set-style("standard")

=== Custom Styles

You can create your own style by defining a function that takes a string and returns a styled string.

#let my_style(sym) = box(
  rect(
    inset: (x: 4pt),
    outset: (top: 2pt),
    stroke: rgb("#d42e2e"),
    radius: 3pt,
    fill: rgb("#ff8f33"),
    text(fill: black,font: "DejaVu Sans Mono", sym),
  ),
)

== Symbols

=== Mac Keyboard Symbols

#lib-name provides symbols for Mac keyboard. You may need install `Fira Code` font to see the symbols correctly.

- #link("https://fonts.google.com/specimen/Fira+Code?preview.text=%E2%8C%98%E2%87%A7%E2%8C%A5%E2%8C%83%E2%86%A9&query=fira+code")[Fira Code \@ Google Fonts]
- #link("https://support.apple.com/en-hk/guide/mac-help/cpmh0011/mac")[Apple Mac Keyboard Symbols]

#grid(columns: (2fr, 1fr, 2fr, 1fr), rows: 2em,align: horizon, ..keyle.mac-key.pairs().map(item => (
    [`#keyle.mac-key.`#raw(item.at(0))],
    [#keyle.kbd(item.at(1))],
  )).flatten())

=== Linux Biolinum Keyboard Symbols

#lib-name provides symbols for Linux Biolinum Keyboard font.

- #link("https://libertine-fonts.org/")[Linux Biolinum Keyboard]

#keyle.kbd-set-style("biolinum")
#grid(columns: (2fr, 1fr, 2fr, 1fr), rows: 2em,align: horizon, ..keyle.biolinum-key.pairs().map(item => (
    raw(lang: "typst", "#keyle.biolinum-key." + item.at(0)),
    [#keyle.kbd(item.at(1))],
  )).flatten())
#keyle.kbd-set-style("standard")

= Available commands

#tidy-module(read("../src/keyle.typ"), name: "keyle", include-example-scope: true)
