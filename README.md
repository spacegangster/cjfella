#cjfella
## Rewrites heads of AMD modules to turn them into CommonJS
Works only with CoffeeScript files. JS port is welcome.

## Man
Two types of rewrite are possible.
### Simple unwrap
```coffeescript
define ->
  console.log "independent code"
  console.log "independent code"
  console.log "independent code"
  console.log "independent code"
  console.log "independent code"
```
results into:
```coffeescript
console.log "independent code"
console.log "independent code"
console.log "independent code"
console.log "independent code"
console.log "independent code"
```

### Dependencies rewrite
```coffeescript
define [
  'underscore'
  'other-lib'
], (
  _
, my_lib
) ->

  log = _.bind(console.log, console)
  log "dependent code"
```

Results into:
```coffeescript
_ = require 'underscore'
my_lib = require 'other-lib'

log = _.bind(console.log, console)
log "dependent code"
```


Note that head of the cs file should comply to the format:
```
define [
  'dep1-path'
  'dep2-path'
], (
  dep1name
, dep2name
) ->
```
