test
testCanOpenModelFromImage
| p |
p := CMProjectManager new.
p openImageProject: #Conway.
self assert: p currentProject cormasModel class name equals: #CMConwayModel