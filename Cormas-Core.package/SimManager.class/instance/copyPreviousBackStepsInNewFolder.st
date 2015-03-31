replay-forward
copyPreviousBackStepsInNewFolder
	
	| stepFiles previousFolder |
	stepFiles := self simFolder directoryContents
		select:
			[:st | 
			(st
				indexOfSubCollection: self stepNameStart
				startingAt: 1) ~= 0].
	stepFiles := stepFiles
		select:
			[:str | 
			(str
				copyFrom: 1 + self stepNameStart size
				to: str size) asNumber <= self currentTime].	"change it simFolder and simName"
	previousFolder := self simFolder copy.
	self simFolder: self class newFolder.
	self simFolder makeWritable.
	self simName: self class newFolder tail.	"copy the stepfiles to the new folder"
	stepFiles
		do:
			[:str | 
			| files |
			files := previousFolder filenamesMatching: str.
			files isEmpty
				ifFalse:
					[files first copyTo: (self simFolder construct: files first tail)]]