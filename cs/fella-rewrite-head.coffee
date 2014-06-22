emp = require 'f-empower'

{ a_map
  count
  drop
  inc
  index_of
  map
  slice
  str_join
  str_split
  tail
  take } = emp

dropr = (items_to_drop, arr) -> # TODO move to f-empower
  (slice arr, 0, (Math.max ((count arr) - items_to_drop), 0))

tailr = (chars_to_drop, str) -> # TODO move to f-empower
  str.substr(0, (Math.max ((count str) - chars_to_drop), 0))


find_splitter_idx = (lines) ->
  (index_of '], (', lines)

read_deps_names = (deps_lines) ->
  fmt_dep = (dep_line) ->
    (tailr 1, (tail 3, dep_line))
  #
  (a_map deps_lines, fmt_dep)

read_local_names = (local_names) ->
  fmt_local = (local_line) ->
    (tail 2, local_line)
  #
  (a_map local_names, fmt_local)

mk_statement = (var_name, dep_path) ->
  "#{var_name} = require \"#{dep_path}\""

# @param {Array<string>} amd_source coffeescript strictly formatted
#  define [
#    dependency paths...
#  ], ( 
#    modules local names...
#  ) ->
#  or `define ->` -- independent modules
rewrite_head = (amd_source_lines) ->
  return [] if (count amd_source_lines) == 1
  #
  lines        = (dropr 1, (drop 1, amd_source_lines))
  splitter_idx = (find_splitter_idx lines)
  deps_lines   = (take splitter_idx, lines)
  locals_lines = (drop (inc splitter_idx), lines)
  #
  deps   = (read_deps_names deps_lines)
  locals = (read_local_names locals_lines)
  #
  require_statements = (map mk_statement, locals, deps)

module.exports = rewrite_head
