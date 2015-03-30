actions
openDialog: uneBoite with: sup
	
	| bdr win origin |
	self supervisor: sup.
	bdr := self allButOpenInterface: uneBoite.
	win := bdr window.
	origin := sup builder window globalOrigin.
	win openIn: (origin extent: win minimumSize)