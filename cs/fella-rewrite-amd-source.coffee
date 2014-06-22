fn           = require 'f-empower'
rewrite_head = require './fella-rewrite-head'

{ cat
  drop
  inc
  index_of
  map
  partial
  str_join
  str_split
  tail
  take } = fn


find_head_end_idx = (lines) ->
  idx = -1
  for item in [') ->', 'define ->']
    idx = (index_of item, lines)
    if idx != -1
      return idx
  idx

remove_indent = (lines) ->
  (map (partial tail, 2), lines)

rewrite = (amd_headed_source) ->
  #console.log ">> got source \n", amd_headed_source, '\n'
  #
  lines = (str_split '\n', amd_headed_source)
  head_end_idx = (find_head_end_idx lines)
  head_lines = (take (inc head_end_idx), lines)
  rest_lines = (remove_indent (drop (inc head_end_idx), lines))
  #console.log "took head \n", head_lines
  #
  commonjs_lines = (cat (rewrite_head head_lines), rest_lines)
  commonjs_source = (str_join '\n', commonjs_lines)

module.exports = rewrite
