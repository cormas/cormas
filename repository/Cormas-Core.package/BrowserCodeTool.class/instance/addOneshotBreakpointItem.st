probes
addOneshotBreakpointItem
	
	<itemInMenu: #(#mainMenu) position: 25.15>
	^(MenuItem
		labeled: #NewOneShotBreakpoint << #pdp >> 'Insert Oneshot Breakpoint')
		value: [self addOneshotBreakpoint];
		enablement: #areProbeCommandsLegal;
		labelImage: OneshotProbe breakpointGlyph