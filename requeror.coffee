rewrite = require './requeror-rewrite-amd-source'

amd_source = """
define [
  "jquery"
  "strang"
], (
  $
, fn
) ->

  { init } = fn
"""

console.log "\n>> STARTING\n"
console.log((rewrite amd_source))
