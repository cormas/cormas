initialize-release
lineWidth: lw nbSegments: nbreSegments sizeRatio: sr ev: ev colR: colR colG: colG colB: colB
	"called from 'cormas readVSFile' "
	
	lineWidth := lw.
	sizeRatio := sr.
	isStroked := ev.
	nbSegments := nbreSegments.
	color := ColorValue red: colR green: colG blue: colB.
	self calculPolyline: nbreSegments.
	^self