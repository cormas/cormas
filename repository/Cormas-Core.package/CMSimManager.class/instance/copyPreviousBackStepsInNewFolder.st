replay-forward
copyPreviousBackStepsInNewFolder
	
	| stepFiles previousFolder |
	stepFiles := (self simFolder directories select: [ : st | st beginsWith: self stepNameStart ])
		select: [ : str | 
			(str
				copyFrom: 1 + self stepNameStart size
				to: str size) asNumber <= self currentTime ].	"change it simFolder and simName"
				
	previousFolder := self simFolder copy.
	self simFolder: self class newFolder.
	self simName: self class newFolder tail.	"copy the stepfiles to the new folder"
	stepFiles do: [ : str | 
		| files |
		(files := previousFolder filesMatching: str) isEmpty
			ifFalse: [ files first copyTo: (self simFolder / files first tail) ] ]