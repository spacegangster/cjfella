// Generated by CoffeeScript 1.7.1
var amd_source, rewrite_head;

rewrite_head = require('./requeror-rewrite-head');

amd_source = "define [\n  \"jquery\"\n  \"strang\"\n], (\n  $\n, fn\n) ->";

console.log("\n\n");

console.log(rewrite_head(amd_source));
