charts
setTitleFromSheet: aSheet
	"Answer a String with the title of the graph"
	
	| info title |
	info := aSheet columnTitles.
	title := 'Dynamics of '.
	2
		to: info size
		do:
			[:i | 
			title := title , (info at: i).
			i = (info size - 1)
				ifTrue: [title := title , ' and ']
				ifFalse: [title := title , ', ']].
	^title
		copyFrom: 1
		to: title size - 2