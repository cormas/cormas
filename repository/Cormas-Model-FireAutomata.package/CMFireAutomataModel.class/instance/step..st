control
step: t
"To be completed"

	self stepSynchronously: t.
	self theCMFiremans do: [:fm | fm step].