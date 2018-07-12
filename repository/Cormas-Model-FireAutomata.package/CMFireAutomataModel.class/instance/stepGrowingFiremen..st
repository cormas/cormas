control
stepGrowingFiremen: t
"To be completed"

	self stepSynchronously: t.
	self theCMFiremans do: [:fm | fm step. fm agsize: fm agsize + 1].