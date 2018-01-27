resources
displayOptionsMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #displayOptionsMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Delimitors size' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: '0 pixel' 
			#nameKey: #pixel0 
			#value: #pixel0 
			#indication: true 
			#indicationSelector: #delimiterSize) #(MenuItem 
			#rawLabel: '1 pixel' 
			#nameKey: #pixel1 
			#value: #pixel1 
			#indication: true 
			#indicationSelector: #delimiterSize) #(MenuItem 
			#rawLabel: '2 pixels' 
			#nameKey: #pixel2 
			#value: #pixel2 
			#indication: true 
			#indicationSelector: #delimiterSize) #(MenuItem 
			#rawLabel: '3 pixels' 
			#nameKey: #pixel3 
			#value: #pixel3 
			#indication: true 
			#indicationSelector: #delimiterSize)) #(4) nil)) #(MenuItem 
		#rawLabel: 'Track agents' 
		#nameKey: #trackAgents 
		#indication: false) #(MenuItem 
		#rawLabel: 'Set track length' 
		#value: #setTrackLength) #(MenuItem 
		#rawLabel: 'Default interface tool' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Inspect' 
			#nameKey: #toolInspect 
			#value: #toolInspect 
			#indication: true 
			#indicationSelector: #defaultTool) #(MenuItem 
			#rawLabel: 'Manipulate' 
			#nameKey: #toolManipulate 
			#value: #toolManipulate 
			#indication: true 
			#indicationSelector: #defaultTool) #(MenuItem 
			#rawLabel: 'Create' 
			#nameKey: #toolCreate 
			#value: #toolCreate 
			#indication: true 
			#indicationSelector: #defaultTool) #(MenuItem 
			#rawLabel: 'Zoom' 
			#nameKey: #toolZoom 
			#value: #toolZoom 
			#indication: true 
			#indicationSelector: #defaultTool)) #(4) nil) 
		#helpText: 'Default tool used when clicking entities in the space interface') #(MenuItem 
		#rawLabel: 'Enable touchpad mode' 
		#nameKey: #toggleTouchpadMode 
		#value: #toggleTouchpadMode 
		#indication: false) #(MenuItem 
		#rawLabel: 'Enable Undo/Redo' 
		#nameKey: #toggleUndoRedo 
		#value: #toggleUndoRedo 
		#indication: true) #(MenuItem 
		#rawLabel: 'Space interface menu bar' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'full menu' 
			#nameKey: #siMenuFull 
			#value: #siMenuFull_apply 
			#indication: true 
			#indicationSelector: #siMenuFormat) #(MenuItem 
			#rawLabel: 'pov, info, track, Habitus' 
			#nameKey: #siMenuLimitedWithHabitus 
			#value: #siMenuLimitedWithHabitus_apply 
			#indication: false 
			#indicationSelector: #siMenuFormat) #(MenuItem 
			#rawLabel: 'pov, info, track' 
			#nameKey: #siMenuLimited 
			#value: #siMenuLimited_apply 
			#indication: false 
			#indicationSelector: #siMenuFormat) #(MenuItem 
			#rawLabel: 'pov, info, Habitus' 
			#nameKey: #siMenuLimited2WithHabitus 
			#value: #siMenuLimited2WithHabitus_apply) #(MenuItem 
			#rawLabel: 'pov, info' 
			#nameKey: #siMenuLimited2 
			#value: #siMenuLimited2_apply) #(MenuItem 
			#rawLabel: 'none' 
			#nameKey: #siMenuNone 
			#value: #siMenuNone_apply)) #(6) nil)) #(MenuItem 
		#rawLabel: 'Show single default pov in menu' 
		#nameKey: #toggleShowSingleDefaultPov 
		#value: #toggleShowSingleDefaultPov 
		#indication: true) #(MenuItem 
		#rawLabel: 'Show single default info in menu' 
		#nameKey: #toggleShowSingleDefaultInfo 
		#value: #toggleShowSingleDefaultInfo 
		#indication: true)) #(9) nil) decodeAsLiteralArray