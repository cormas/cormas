- activityEditor
allActivitySelectors
	"Return the instance selectors defined for the activityDiagrams '.
	ex: Agent allActivitySelectors"
	
	^self allActivityDiagramSelectors
		collect: [:as | self instanceSelectorFrom: as]