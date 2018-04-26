opening
open
 	" Open the receiver's window " 

	| win |
	
	CMApplicationProject release.
	PFProjectSettings currentApplicationClass: CMApplicationProject.
	" Rebuild translator table "
	CMApplicationProject uniqueInstance translator: nil.		
	win := self new 
		openWithSpec;
		centered;
		startFSM;
		yourself.
	win simWindow hideSimInterface