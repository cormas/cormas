decisions sheets
setBlocksInvisible
	
	self model updateName.
	self blocks keys do: [:bn | self setInvisibleBlock: bn]