tests
testMode
"in R
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}
getmode(c(10,20,58,96,48,76,57,68,19,10))

"
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas mode: n) equals: #(10).