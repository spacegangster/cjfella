parsegs  = require 'minimist'
fn       = require 'f-empower'
file_io  = require './cs/fella-io'

{ drop
  first
  is_empty } = fn

parsed_args = (parsegs (drop 2, process.argv))


normalize_args = (args) ->
  return null if (is_empty args._)
  #
  in   : (first args._)
  out  : args.o || args.out
  help : args.h || args.help


# @param {string} opts.out -- out file
# @param {string} opts.in  -- incoming file
run = (opts) ->
  on_done = ->
    #console.log "your module is rewritten"
  #
  (file_io opts.in, opts.out, on_done)

print_usage = ->
  console.log """
  Usage:
  cjfella  -o cjs-style.coffee  amd-style.coffee
  """
    

#console.log "\n>> STARTING\n"
#console.log process.argv
#console.log parsed_args
#console.log((rewrite amd_source))

opts = (normalize_args parsed_args)
if !opts || opts.help
  print_usage()
else
  (run opts)
