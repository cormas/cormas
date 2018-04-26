- initialize-release
setSurround
	"Returns a collection of cells that surround the aggregate, including the cells located into the aggregate"
	"Faut dire c'qui est, c'est du brutal !
	Met a jour et retourne l'attribut surround = une collection de cellules externes qui bordent l'agregat"
	
	| ens ensVoisins |
	ens := Set new.
	ensVoisins := Set new.
	ens addAll: self components.
	self components do: [:cell | ensVoisins addAll: cell neighbourhood].
	self surround: (OrderedCollection withAll: ensVoisins - ens).
	^surround