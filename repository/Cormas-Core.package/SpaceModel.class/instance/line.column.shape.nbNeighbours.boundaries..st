private - init
line: l column: c shape: ps nbNeighbours: nbn boundaries: b
	
	self gridCellShape: ps.
	self nbNeighbours: nbn.
	boundaries := b.
	self line: l column: c