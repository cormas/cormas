update
update: unS with: unO
	"	unS == #Model ifTrue: [vueObs invalidate]."
	
	unS == #OpenFenetre ifTrue: [unO inspect]