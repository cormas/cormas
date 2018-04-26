building
buildBrowser
"self new buildBrowser"
glm := GLMTabulator new.
glm title:'CORMAS Entities Classes'.
glm column:#A1;column:#A2 span:4.

glm transmit to:#A1;andShow:[:glma :model| 
	glma list title:'Models'; display:[:e | e ] ].

glm transmit to:#A2;from:#A1;
	andShow:[:glma :model| 
	"glma accordionArrangement.	"
	glma tree title:'Spatial Entities Classes'; display:[:aModelClass | aModelClass spatialClasses];
	dynamicActionsOnSelection:[
		"put the list of item to execute"
		|actions act|
		actions:= OrderedCollection new.

		act:=GLMGenericAction new 
		action:[ :a | a selection inspect];
		title:'Inspect'.
		actions add:act.
		
		act:=GLMGenericAction new 
		action:[ :a | a selection browse];
		title:'Browse'.
		actions add:act.

		actions
		];
	 act: [ :b |  self addSpatialEntityClass. b update ]
	icon: GLMUIThemeExtraIcons glamorousAdd 
	entitled: 'Add a spatial entity class'.
	glma tree title:'Social Entities Classes'; display:[:aModelClass | aModelClass socialClasses];
	act: [ :b | self addSocialEntityClass. b update ]
	icon: GLMUIThemeExtraIcons glamorousAdd
	entitled: 'Add a social entity class'.
	.
	glma tree title:'Passive Entities Classes'; display:[:aModelClass | aModelClass passiveClasses ];
	act: [ :b |  self addPassiveEntityClass. b update ]
	icon: GLMUIThemeExtraIcons glamorousAdd 
	entitled: 'Add a passive entity class'.
	].


glm openOn: CormasModel subclasses.