"
I draw the highlight of a network along one of its links, with the look of the network. A network is drawn as one of my instances for each of its links, over the links and under the agents, so that it never changes how its links look.

## Responsibility:

- Draw a line between the ends of a link, with the color and the thickness of the look of a network, and without an arrowhead.
- Let clicks go through me to the link and the cells below.

## Collaborators:

- `CMBlSpaceElement` creates me for each link of each network that has something to draw.
- `CMObserver` fills the look of the network.

## Public API and Key Messages

- `for:of:observedBy:` creates me for a link of a network.

```
CMBlRouteElement for: aRoad of: aStreet observedBy: CMObserver new
```

## Internal Representation

- `network`: the `CMNetwork` whose highlight I draw.
"
Class {
	#name : 'CMBlRouteElement',
	#superclass : 'CMBlLinkElement',
	#instVars : [
		'network'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'instance creation' }
CMBlRouteElement class >> for: aLink of: aNetwork observedBy: anObserver [

	^ self new
		  observer: anObserver;
		  network: aNetwork;
		  setUpFor: aLink;
		  yourself
]

{ #category : 'accessing' }
CMBlRouteElement >> drawnKey [
	"A link is drawn once for each network that highlights it"

	^ {
		  network.
		  link }
]

{ #category : 'accessing' }
CMBlRouteElement >> look [

	^ observer lookOf: network
]

{ #category : 'accessing' }
CMBlRouteElement >> network: aNetwork [

	network := aNetwork
]

{ #category : 'initialization' }
CMBlRouteElement >> setUpFor: aLink [

	self preventMouseEvents.
	super setUpFor: aLink
]

{ #category : 'accessing' }
CMBlRouteElement >> showsArrowhead [

	^ false
]
