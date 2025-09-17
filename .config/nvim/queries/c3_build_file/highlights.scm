[
 "("
 ")"
] @punctuation.bracket

"end" @keyword

(NUMBER) @number

(
  (IDENT) @parameter
  (#match? @parameter "^(LIB|EXE|HOME|FILE|DIR|VERSION|MIN|MAX)$")
)

(
  (IDENT) @variable
  (#not-match? @variable "^(LIB|EXE|HOME|FILE|DIR|VERSION|MIN|MAX)$")
)

(
  (IDENT) @function.call
  (#match? @function.call "^(require|echo|option|create|copy|cmd|compiler)$")
)

(STRING) @string

(COMMENT) @comment
