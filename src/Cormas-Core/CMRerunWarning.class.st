"
I warn that a saved run is rerun with other code than the one it was made with, so its data may differ. My message names each difference: the version of Cormas, the commit of the model, or uncommitted changes.

Resuming me goes on with the rerun, which records its own versions.

```smalltalk
[ CMSimulation rerun: aRunFolder ]
	on: CMRerunWarning
	do: [ :warning | warning resume ]
```
"
Class {
	#name : 'CMRerunWarning',
	#superclass : 'Warning',
	#category : 'Cormas-Core-Simulation',
	#package : 'Cormas-Core',
	#tag : 'Simulation'
}
