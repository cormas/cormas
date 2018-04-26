decisions sheets
eraseDecisionsSheet
	
	self model updateName.
	self blocks keys
		do:
			[:bn | 
			self setInvisibleBlock: bn.
			self mazBlock: bn]