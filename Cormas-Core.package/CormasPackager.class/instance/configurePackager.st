private
configurePackager
	"configure the specifics options needs for packaging Cormas.
	Reproduce the manual settings done in an interactive runtime packager session"
	
	| options keptItems |
	options := runtimePackager options.
	options removeCompiler: false.
	options errorNotifierClass: RuntimeDebugNotifier value.
	options operatingSystems: (Set with: #win).
	options uiLooks: (Set with: #win).
	options imagePath: self targetImagePath asString.
	options removeOrganization: false.
	keptItems := runtimePackager keptItems.
	self keepClass: ListIconLibrary into: keptItems.
	self keepClass: ToolbarIconLibrary into: keptItems.
	keptItems keepSelector: #localPointToGlobal: inClass: VisualPart.
	self keepClass: ColoredArea into: keptItems.
	self keepClass: ColoredAreaController into: keptItems.
	self keepClass: TextFigure into: keptItems