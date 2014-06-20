rewrite_head = require './requeror-rewrite-head'


amd_source = """
define [
  "jquery"
  "strang"
], (
  $
, fn
) ->
"""

console.log "\n\n"
console.log((rewrite_head amd_source))
