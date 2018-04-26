hierarchie
degreMax: v
	
	degreMax := v.
	populationObservateur do: [:a | self computeLevel: a].
	observateur vueObs invalidate