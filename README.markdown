rpn-converter
=============

convert infix notation to reverse polish notation. Only supports parens and ``[+-*/]``

## Usage
````
converter = RPNConverter.new

converter.infix_to_rpn '1 + 1'
  => '1 1+'

converter.infix_to_rpn '1 + 2 * 3'
  => '1 2 3*+'

converter.infix_to_rpn '(1 + 2) * 3'
  => '1 2+3*'
````

## Future
Add support for exponents and boolean logic.
