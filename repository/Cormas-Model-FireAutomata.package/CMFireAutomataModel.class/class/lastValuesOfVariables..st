examples
lastValuesOfVariables: aDictionnary
	"a Dictionnary is a dictionnary formatted by CORMAS with name of the class containing a dictionnary of keys"

	"representing values, containing collection"
	"This is a really bad conception and we need to replace all of this by DataFrame later :-)"
	| d r |

	d := Dictionary new.
	(aDictionnary at: self name) keysAndValuesDo: [ :k :v | d at: k put: v last ].
	r := Dictionary new.
	r at: self name asSymbol put: d.
	r := r values first.
	^ r 