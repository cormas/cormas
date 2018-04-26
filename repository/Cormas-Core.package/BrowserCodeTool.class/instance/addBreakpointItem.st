probes
addBreakpointItem
	
	<itemInMenu: #(#mainMenu) position: 25.10>
	^(MenuItem labeled: #InsertBreakpoint << #pdp >> 'Insert Breakpoint')
		enablement: #areProbeCommandsLegal;
		value: [self addBreakpoint];
		labelImage: CodeProbe breakpointGlyph