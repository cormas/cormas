parametres
menuFonction
	
	| mb |
	mb := MenuBuilder new.
	mb add: 'Editer' -> #specialEditFonction.
	mb add: 'Evaluer' -> #specialEvalFonction.
	mb line.
	mb addFindReplaceUndo.
	mb line line.
	mb addCopyCutPaste.
	^mb menu