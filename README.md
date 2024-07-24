# keyle

This package provides a simple way to style keyboard shortcuts in your
documentation.

Inspired by [auth0/kbd](https://auth0.github.io/kbd/).

## Usage

See more examples in the [example](./example) directory.

### Basic

``` typ
#kbd("Ctrl")
#kbd("Ctrl", "C")
#kbd(com-key.shift, com-key.alt, "A")
```

### Compact

``` typ
#kbd("Ctrl", "A", compact: true)
```

### Custom Delimiter

``` typ
#kbd("Ctrl", "A", compact: true, delim: "-")
#kbd(mac-key.command, "S", compact: true, delim: "")
#kbd(mac-key.shift, mac-key.tab-left, mac-key.escape, compact: true, delim: "")
```

### Custom Style

```typ
#kbd("Ctrl", "A", style: kbd-style.deep-blue)
```