test:
    rm -f test/test-*.png
    typst compile test/tests.typ 'test/test-{n}.png' --root . --ppi 200

doc:
    typst compile doc/keyle.typ 'doc/keyle.pdf' --root .