(jsx_attribute
  "=" @conceal
  (string (string_fragment)) @conceal
  (#set! conceal ""))

(jsx_attribute
  "=" @conceal
  (jsx_expression) @conceal
  (#set! conceal ""))
