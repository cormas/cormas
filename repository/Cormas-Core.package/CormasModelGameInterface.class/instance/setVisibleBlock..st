blocks
setVisibleBlock: aBlockName
	
	aBlockName ~= #Events
		ifTrue:
			[(self blocks at: aBlockName)
				do:
					[:list | 
					list
						do:
							[:specName | (self builder namedComponents at: specName) beVisible]]]
		ifFalse:
			[self blocks
				keysAndValuesDo:
					[:k :v | 
					k = #Events
						ifTrue:
							[v
								do:
									[:list | 
									list
										do:
											[:specName | (self builder namedComponents at: specName) beVisible]]]
						ifFalse:
							[v
								do:
									[:list | 
									list
										do:
											[:specName | (self builder namedComponents at: specName) beInvisible]]]]]