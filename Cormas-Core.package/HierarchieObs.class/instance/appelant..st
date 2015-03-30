acces
appelant: v
	
	appelant := v.
	higherLevels := appelant higherLevels asValue.
	oneLevel := appelant oneLevel asValue.
	levelHolder := appelant level asValue.
	degreMaxHolder := appelant degreMax asValue.
	levelHolder onChangeSend: #levelHolderChanged to: self.
	oneLevel onChangeSend: #oneLevelChanged to: self.
	higherLevels onChangeSend: #higherLevelsChanged to: self.
	degreMaxHolder onChangeSend: #degreMaxHolderChanged to: self