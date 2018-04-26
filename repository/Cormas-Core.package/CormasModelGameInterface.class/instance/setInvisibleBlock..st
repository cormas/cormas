blocks
setInvisibleBlock: aBlockName
	
	(self blocks at: aBlockName)
		do:
			[:list | 
			list
				do:
					[:specName | (self builder namedComponents at: specName) beInvisible]]