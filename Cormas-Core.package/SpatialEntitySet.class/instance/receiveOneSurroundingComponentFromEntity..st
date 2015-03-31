+ components - managing
receiveOneSurroundingComponentFromEntity: y
	"Purpose: performs an exchange of component among the receiver and another spatial entity made of same kind of lower level spatial entities
The two spatial entities have to be neighbours.
The component for the exchange is selected according to the neighbourhood coherence principle
Arguments: y = <SpatialEntitySet>"
	
	| potentialComponents winner |
	potentialComponents := self surround
		select: [:c | y components includes: c].
	potentialComponents isEmpty
		ifFalse:
			[potentialComponents := potentialComponents
				asSortedCollection: [:i :j | (i nciAbout: y) < (j nciAbout: y)].
			potentialComponents := potentialComponents
				select:
					[:c | (c nciAbout: y) = (potentialComponents first nciAbout: y)].
			winner := Cormas selectRandomlyFrom: potentialComponents.
			self receiveComponent: winner fromEntity: y].
	^winner