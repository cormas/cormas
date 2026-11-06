Extension { #name : 'CMModel' }

{ #category : '*Cormas-Workspace' }
CMModel class >> folder [
	"Return the folder of my model in the workspace, where its data, screenshots and outputs are, such as self folder / 'data' / 'map.csv'"

	^ CMWorkspace current folderOf: self
]

{ #category : '*Cormas-Workspace' }
CMModel >> folder [
	"Return the folder of my model in the workspace, where its data, screenshots and outputs are, such as self folder / 'data' / 'map.csv'"

	^ self class folder
]
