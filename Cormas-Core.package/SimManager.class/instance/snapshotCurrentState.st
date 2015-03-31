replay-store/restore
snapshotCurrentState
	"Snapshot the current simulation state as BOS file. Time is temporary set to 0, in order to use the BOS file as initial state of further simulations"
	
	| finename currentTime text |
	finename := Dialog
		requestNewFileName: 'Save current simulation state as'
		default:
			((Cormas dumpPath: self cormasModel class name)
				construct: (self stepFileNameAtStep: 0)).
	finename isEmpty ifTrue: [^nil].
	currentTime := self currentTime.
	self currentTime: 0.
	self cormasModel dumpOrganizationOnFile: finename asFilename.
	self currentTime: currentTime.
	text := ('	Dump at step ' , currentTime printString) asText.
	text := text , '\	The current simulation state has been saved as ' withCRs
		, (finename asText emphasizeAllWith: #italic).
	text := text
		,
			'\	To reuse it as starting point for the next simulations, write the following instruction into an #init method: \	'
				withCRs.
	text := text
		,
			(('self restoreOrganizationFromFile: ''' , finename , ''' asFilename')
				asText emphasizeAllWith: #bold).
	Dialog warn: text.
	Cormas println: text