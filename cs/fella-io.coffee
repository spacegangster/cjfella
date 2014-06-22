rewrite  = require './fella-rewrite-amd-source'
fs       = require 'fs'
fn       = require 'f-empower'
read_std = require 'stdin'

{ bind
  partial } = fn

read_file   = fs.readFile
write_file  = fs.writeFile
write_std   = (bind console.log, console)


read_rewrite = (in_file_name, out_file_name, cb) ->
  read  =
    in_file_name &&
    (partial read_file, in_file_name, {encoding: 'utf8'}) ||
    read_std
  write =
    out_file_name &&
    (partial write_file, out_file_name) ||
    write_std

  on_read = (err, str) ->
    if err
      (cb err)
    # console.log ">> have read", str
    (write (rewrite str), cb)

  (read in_file_name, on_read)

module.exports = read_rewrite
