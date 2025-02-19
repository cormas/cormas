Class {
	#name : 'CMFarmingPlants',
	#superclass : 'Object',
	#classVars : [
		'icons'
	],
	#category : 'Cormas-UI-Tilesets',
	#package : 'Cormas-UI-Tilesets'
}

{ #category : 'stages' }
CMFarmingPlants class >> carrot [

	<script: 'self carrot inspect'>
	^ { 
		self frame10 .
		self frame11 .
		self frame12 .
		self frame13
	}
]

{ #category : 'stages' }
CMFarmingPlants class >> corn [

	<script: 'self corn inspect'>
	^ { 
		self frame40 .
		self frame41 .
		self frame42 .
		self frame43
	}
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame03 [
	"Private - Generated method"
	<script: 'self frame03 inspect'>
	^ self icons
		at: #frame03
		ifAbsentPut: [ Form fromBinaryStream: self frame03Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame03Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/03_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAKRJREFUOE9jZKAQMFKon2EQG7B/Zch/x/A1cBei82Fex+uFDdOc/wdk7WWE0djCi2AY4NMMMhCnATAnwwwgyQvImmHOBnkFmyEEvTC1yvt/dttWnOpob0DFwoj/ogKs8Ago9l+MYilWF/RujP0P0/H6w28GHUVuhpfvfzGga8YbCyBDxAXZGK7c/8oAcgE2zXgNAEmCDAG5oCN+BfmBCAoDfAYAAIfBVBHgLJO2AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame04 [
	"Private - Generated method"
	<script: 'self frame04 inspect'>
	^ self icons
		at: #frame04
		ifAbsentPut: [ Form fromBinaryStream: self frame04Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame04Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/04_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAMdJREFUOE9jZKAQMFKonwGnAftXhvx3DF8Dl0fnwyzG64IN05z/B2TtZYTR2FxL0Av4NIMMJOgFmAEkeQGmGKQZ5myQV7AZQtALU6u8/2e3bcWpjvYGVCyM+C8qwAqPgGL/xSiWYnVB78ZYuN9ff/jNoKPIzfDy/S8GdM14YwFkiLggG8OV+18ZQC7AphmvASBJkCEgF3TEryA/EEFhQJIBVw5mwv2vYz+dkSwDFIzNGb69vcGw+MJTBpAXYhQE4bEAMhQ5TwAAMElpEcXBbm8AAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame05 [
	"Private - Generated method"
	<script: 'self frame05 inspect'>
	^ self icons
		at: #frame05
		ifAbsentPut: [ Form fromBinaryStream: self frame05Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame05Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/05_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAGxJREFUOE9jZKAQMFKon2HUAIZhGwZLDiX/f/n+F0Ox/2KC0YxVQe/G2P+gBAYygJBhOG2AGQJLqbhcg9eJFQsj/nfEr8CrBqvknZ1dYC/MeXGOIUXCCOwIFfcyrGpxmg4zBJ9mkBzBUCaUWwGBRyUR1xOOpAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame06 [
	"Private - Generated method"
	<script: 'self frame06 inspect'>
	^ self icons
		at: #frame06
		ifAbsentPut: [ Form fromBinaryStream: self frame06Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame06Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/06_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAALNJREFUOE9jZKAQMFKon2E4GtC7MfZ/sf9ior2GohCk2VhZmOHs3bcM6IbgMhirAaCYQTYEn8FYDXjy7jM4dq/c/8ogKsDKAHIVuqGw6MfwK8g2kKS4IBvYAB1FbrBaGSFerF7DGVggg15/+A024OX7X2BDsAUu3tCuWBjxH+QFfLFC0ICO+BV41WBI3tnZBQ4DEJjz4hxDioQRSnZRcS9D0YPVdGRDkHWjawbJEZ3icOVaAGqnUREMzvOtAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame07 [
	"Private - Generated method"
	<script: 'self frame07 inspect'>
	^ self icons
		at: #frame07
		ifAbsentPut: [ Form fromBinaryStream: self frame07Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame07Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/07_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAMpJREFUOE9jZKAQMFKonwHFgN6Nsf9hBhb7LybKcLgikGZjZWG4g87efcsAMwSfwRguABny5N1nsEFX7n9lEBVgZcBlMEgNhjNhtokLsoEN0FHkBhsmI8TLgOwqmFNx+hNk0OsPv8EGvHz/C6weW7jgDaiKhRH/QV7AF6AEDeiIX4FXDUEDQC7AF7U4AxGkCTkMcHkDqwtAAQiLBbLDABYLJIXBnZ1d8KQM8sKcF+cYUiSMULKLinsZiqsxvIBuCLJudM1YUyKpuRMAUk1fEVFcL/wAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame08 [
	"Private - Generated method"
	<script: 'self frame08 inspect'>
	^ self icons
		at: #frame08
		ifAbsentPut: [ Form fromBinaryStream: self frame08Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame08Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/08_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPhJREFUOE9jZMABejfG/i/2X8xYsTDif0f8CkZc6rBKgDQbKwsznL37luH1h98MIANgBqIbhGEATPOTd5/Baq/c/8ogKsDKADMQ5CpkQ1A4MM0gBSDbxQXZwAboKHKD9cgI8YLFkQ3B6gKQYpAikIEgL4AMePn+F9gVMMNhhuAMHJgzQYEI8gLMQJjhMHmiDCA5FpADCRaNIO+g2w7i44xGmGKYF7D5H6sB6DEBC0RYLOANRGTNyOkAFgswrxEVjSDFsHQAiwVsyRlvLMDSAdGxcGdnFzikkcGcF+cYUiSMUMRU3MvgFmO4AJshyLqRNeOMRlxZF5s4AGo2kxEnaRejAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame09 [
	"Private - Generated method"
	<script: 'self frame09 inspect'>
	^ self icons
		at: #frame09
		ifAbsentPut: [ Form fromBinaryStream: self frame09Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame09Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/09_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAP9JREFUOE9jZEADvRtj/xv9+M6gbaHCsPjCU7BsurMzw7e3NxiunrjD4Bi+hhFZCwoHJlGxMOK/qAArw+sPvxlANDIo9l9M2ACQK0CaYUBHkRvOfvn+FwOyIRguAGk2VhZmePLuM8OV+1/BGkEGgDSCxEHg7N23cENQDIBphikSF2QDGwLyBshWkDxIjqALYIpgXumIX4E1rEDqcEogByhVDMDmfJwuQFYMi1JsAYjVAPSABEUnLBplhHiJjwVQNIIAKBZg0QgLF6JiAaQYPRrRkz3BWCA5Gu/s7AInFGQw58U5hhQJIxQxFfcyePRjpANshiDrRtZM0AvY/IwuBgAknZMRIBocfgAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame10 [
	"Private - Generated method"
	<script: 'self frame10 inspect'>
	^ self icons
		at: #frame10
		ifAbsentPut: [ Form fromBinaryStream: self frame10Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame10Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/10_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAGNJREFUOE9jZKAQMFKon2HUAIbRMGCgVRgsOZT8/+X7XwzF/osZkdnYUi3WlNi7MfY/SLG4IBsDyCAQABlGlAF3dnaBNc95cQ6uPkXCCMxWcS/DMASrqTBDkG3EphkkT3FmAgCuhCARVFRjXAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame11 [
	"Private - Generated method"
	<script: 'self frame11 inspect'>
	^ self icons
		at: #frame11
		ifAbsentPut: [ Form fromBinaryStream: self frame11Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame11Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/11_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAItJREFUOE9jZKAQMFKon2HUAIZhGwZLDiX/f/n+F0Ox/2JwNKPzkdMO1nTQuzH2P3oCe/3hN0NH/AoM9TgTEsgQkCYYwKYZJIc3Ja5Ljfn/8i03Q+a6mTjVYUjc2dkFdv6lNZcYHEKlGV4+ecVwYAsbg2u6MtgxKu5lKHqwmgwzBD0c0DUT9AIxORUAi7UyEd3dcuAAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame12 [
	"Private - Generated method"
	<script: 'self frame12 inspect'>
	^ self icons
		at: #frame12
		ifAbsentPut: [ Form fromBinaryStream: self frame12Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame12Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/12_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPFJREFUOE9jZKAQMFKon2GkGNC7MfY/LKyK/RejeBuFg00hSMxYWRis/+zdtwwEDUBXDDJAXJCNQUaIl2HH2RcMHfEr8LsAZMCTd5/BNr58/4sBpBkErtz/iqEZJI4RjRULI8D+1VHkhieRwwd/MsysXYI1ynGmA5BB7x+xgA3BpRmrC2DW7qoJAbvk+VNWhqcfOBiq1s8nzgV3dnb9v3f4FIOJnTIkHJ68AtPrNzMwhGVoMqi4l+EORJBmkOKjK84z+EbKwTU/vveZ4cxVXrABIIBsCIppMANghoBokPNBAKYZrwEw/yMbhJxb0Z0PkgMA+0dnEaGOMbgAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame13 [
	"Private - Generated method"
	<script: 'self frame13 inspect'>
	^ self icons
		at: #frame13
		ifAbsentPut: [ Form fromBinaryStream: self frame13Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame13Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/13_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAARJJREFUOE9jZKAQMFKon4F+BvRujP0Pc22x/2K4xWAGsiSIj6wAJm+sLAzW/+TdZ4Yr978ydMSvAOtlBGlGlgQJIiuAyYM0IgOYGrgBuBRULIz4r6PIDdYL0oTMBrmCEV0BSCE2DYcP/mSYWbsErB6kBu4FEAddENlQkDxMM7YoxxmN6c0x8FAH2YwrveCU2FUT8v/LSw6wvhtvWBmq1s/HqharIEizRbAFw5/XrxlePnkFNmT9ZgashsANuLOzC+zke4dPMaBrBok/vveZ4cxVXoawDE2wgSruZZB0ACJgmkHsoyvOM/hGysFthmkG0cgGwAzBMABmCHKgPf0ACQuY7TA5kCtQwgDZJbhCHeZ0mDwAr1KcET9ePWEAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame15 [
	"Private - Generated method"
	<script: 'self frame15 inspect'>
	^ self icons
		at: #frame15
		ifAbsentPut: [ Form fromBinaryStream: self frame15Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame15Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/15_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAGdJREFUOE9jZKAQMFKon2HUAIbRMGCgVRgcuFLw/8m7zwwxdnPBCQ2dj5x6sabEJYeS/4MU+eiGgdVuubwKTMMMxGvAnZ1dYM0bf1xGySb+HLpgvop7GYqlWF0AMwQ9o6FrBslTnJkAhxwgEeh0EtoAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame16 [
	"Private - Generated method"
	<script: 'self frame16 inspect'>
	^ self icons
		at: #frame16
		ifAbsentPut: [ Form fromBinaryStream: self frame16Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame16Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/16_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAJBJREFUOE9jZKAQMFKon2HUAIZhHwZH9kz+D0onNi65OKMbpwRIs46xGjidHdp6lsEvpgqrWgzBJYeSwbb66IbBE+m7V58Yjr3cAebH2M1F0YPVABkhXoYn7z4zWIl7gDWBNMPE8BpwZ2cX2PYTnDcZXr7/hZFN/Dl0wWIq7mVwizFcADMEVyZD1gxSQ3FmAgD8xi8RndBrEAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame17 [
	"Private - Generated method"
	<script: 'self frame17 inspect'>
	^ self icons
		at: #frame17
		ifAbsentPut: [ Form fromBinaryStream: self frame17Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame17Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/17_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAANZJREFUOE9jZKAQMFKon2HUAAbcYXBkz+T/yAFs45KLNbywCoI061uEMPz9fQluxqGtZxn8Yqow1GMIYNMMMuXdq08MV07fxjAEqwE6xmooyQOkGQQIGrDkUDLc3z66YWBbkcH+tUcYbku/ZOiIXwG3GMUFIANkhHjBes7efcsQqOEH1w/SrOzHyLDj7AvsBtzZ2fX/BOdNBpABT959Bmt8sx5hvkjgf7AcyIAUCSMGFfcysCRcBcgAkMCcF+fwZg+QZhDAMAAkCDOEUAaDaUZxASFNuOQBz4VYEa+0E7IAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame18 [
	"Private - Generated method"
	<script: 'self frame18 inspect'>
	^ self icons
		at: #frame18
		ifAbsentPut: [ Form fromBinaryStream: self frame18Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame18Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/18_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAANFJREFUOE9jZKAQMFKon2G4GnBkz+T/2MLGxiUXw8sYAiDN+hYhYP1/f19CMefQ1rMMfjFVKHpQOPg0g0x69+oTw5XTt1EMwTBAx1gNa8yCNIMAxQbsX3uEIblqItxiOKN3Yyw84JLtYuCugNkMEwAZcFv6JUNH/AqwXhQDxAXZIM68/5UhzSIYwysgzew2X8DyOA14+f4XWOPrD78ZJC7woBjy1+EnA8gSDAPu7OwCO3/Oi3NEZY0UCSOwOhX3Mka4F2CGEGUCVDNKGBCrEV0dAE3ZZBFqfP4IAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame20 [
	"Private - Generated method"
	<script: 'self frame20 inspect'>
	^ self icons
		at: #frame20
		ifAbsentPut: [ Form fromBinaryStream: self frame20Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame20Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/20_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAGRJREFUOE9jZKAQMFKon2HUAIbRMGDAEwYHrhT8f/LuM0OM3VxGZDZ6wsOZkJYcSv6PrhhkGNEGwBRWLIz43xG/AqdFOCXu7OwCu2DOi3MMKRJGYPNU3MtIcwHMEFyaQeIUZyYAlEchEZKGOH0AAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame21 [
	"Private - Generated method"
	<script: 'self frame21 inspect'>
	^ self icons
		at: #frame21
		ifAbsentPut: [ Form fromBinaryStream: self frame21Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame21Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/21_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAALlJREFUOE9jZKAQMFKon2HUAAbMMFhyKPk/LGBj7OYyrk8v+x84s4sRXRymBiMQQQr15ETA8nfb/zPw8XEwfPr0g0G5EqL00qM3DCCDCRrw7stPhrN33zIobZNkuOf1nMFYWZhBiIedsAEgk2HOlRHiBRsC0vzk3Wewpci2g/h40wEufyMnPoIJqWJhxP+O+BU41dHGgDs7u+BROefFOYYUCSO4q1Xcy1AsxesCZINAJqBrJhiIxORUADlxShFFHdDXAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame22 [
	"Private - Generated method"
	<script: 'self frame22 inspect'>
	^ self icons
		at: #frame22
		ifAbsentPut: [ Form fromBinaryStream: self frame22Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame22Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/22_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPZJREFUOE9jZKAQMFKon4E2BlQsjPiP7LKO+BU4LcKQAGmGaVhyKBls0JX7Xxl0FLnBZsbYzUXRg8KBaYZp1JMTYXj35SfDk3efGWSEeMEGgNjIBuE0AFkz91Jhhq/Rb1EMgbkErwtANoE08/FxMHz69ANsCAxgNQAkiRwGIP7i6IL/PDxsDF++/GKIXToBI8zgAjB/wwINRMMCE2QINs0gNWADQJqR/QxyXnpzzH9BuT9wQ3AlOLgB6H4D8YkxBG9KBBkAMmhm7RLiExLMJXd2dv3vPnUJzC0104P7QMW9DHdCQtaML5MhG4LXCyBXIBuEbjtIDgCC0oMRWp03tAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame23 [
	"Private - Generated method"
	<script: 'self frame23 inspect'>
	^ self icons
		at: #frame23
		ifAbsentPut: [ Form fromBinaryStream: self frame23Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame23Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/23_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAARdJREFUOE9jZKAQMFKonwHFgIqFEf9xGdgRvwKrZXBBkGZ0RUsOJcMNvHL/KwM2Q8AG4NKsJyfC8O7LT7Cjnrz7zIDNELwGoHuHoAEwJ8fYzQUb3OVV8N9Ymw9sznPfpyjmwdTAXaCjyM0gI8QLdipIEqTZP0CL4cntJ2CNz559YmBM/8wA8xZMHYoBIIXItqMbAJIHGYJsEdwAkCRyKCM7H2Q7DGA1IL055r+g3B+MJCC0UoJBUhAhfO4eA4Nx52ewAEoYgALv8EFIdKEDrm0icKH+4xMwEhNYAD307+zsAieg7lOX4JpLzfTgbBX3MrhBcANgAWPxXR2uEJcBIAUwQ/AagNVPUEEUA9C9AfMCNgOQnQ+SBwBQp6kRTyrEVwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame25 [
	"Private - Generated method"
	<script: 'self frame25 inspect'>
	^ self icons
		at: #frame25
		ifAbsentPut: [ Form fromBinaryStream: self frame25Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame25Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/25_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAHpJREFUOE9jZKAQMFKon2HUAIbBGgYHrhT8f/LuM0OM3VyCsYRVwZJDyf9B6QNkACHDcNoAMwSW0HC5BqsBMFthrsCXWvF64cr9rwwd8SvwhgOG5J2dXWD/g8CcF+cYUiSM4A5QcS/DUI/VdGRDYLqxaQbJEYwmQrkVACdKLxFHg5MwAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame26 [
	"Private - Generated method"
	<script: 'self frame26 inspect'>
	^ self icons
		at: #frame26
		ifAbsentPut: [ Form fromBinaryStream: self frame26Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame26Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/26_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAONJREFUOE9jZKAQMFKon4H2BlQsjPgPcmVH/AqslqEILjmUDFYMAjF2cxlBmmEakdnI3sYwQE9OBCx/6dEbhiv3v4Jtbqvf8f/Du08MXZPDMFyB1YB3X36CDdlx9gXYgLLcVWCX6YXuBLsMpwtAEjBvyAjxgg3QUeRmQHYVQQNgpoMMAnnBw1gCLCTEww72FtEGgDSBAg7kAuSARU83WKPmwJWC/0/efYYHIr7EhtUAWDjAYoFkA2AacMU9zli4s7MLnpBAiua8OMeQImGE4QAV9zK4yzG8gG4Ium5kzSA5ijMTAKhoaBEOTBmdAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame27 [
	"Private - Generated method"
	<script: 'self frame27 inspect'>
	^ self icons
		at: #frame27
		ifAbsentPut: [ Form fromBinaryStream: self frame27Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame27Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/27_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPpJREFUOE9jZKAQMFKon4F6Biw5lPwf5poYu7lEGwxXCDJAT04EbMalR28YYIZULIwAG9wRvwKroRgGvPvyE2zIk3efGa7c/wrXCDIImyEopsK8ISPEi2IASBxkmI4iN9hwZC9idRbMIJgmkIE7zr5giLKXR/EeyDCcgVWWuwrs908fvjAIuOxi8DCWYBDiYSfOAJBmLQMtsHOfPXrC8OjeMwab1KMYzsfqggNXCv6v6NRjkFOSgqcxkAEzFifhjwWYapj/j8y2hhuASzNWF9zZ2QVPUHNenGNIkTBCSe0q7mUoLkHhoGuG6cRnCFZ/IRuEntnwuoCcnAkABml1EerfbScAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame28 [
	"Private - Generated method"
	<script: 'self frame28 inspect'>
	^ self icons
		at: #frame28
		ifAbsentPut: [ Form fromBinaryStream: self frame28Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame28Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/28_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAUZJREFUOE9jZKAQMFKonwFuwJJDyf9hhsXYzYWLVyyMgIt3xK/AsBDFAD05EbAZlx69YQAZAtP8/hELWFxQ7g8DuiEYBrz78hOs+Mm7zwxX7n9lAGmeWbsErC69OeY/jA1zLYqTYN6QEeIFG3D4IMQwxltODP/V9oHZeA2AmQoz6NJqd4ZPH74wWDiYMZw4cIphxuIk3GEA0txWvwMcYB/efQKb5eZkwvDk3Tcwm6ABIM1mBmrwWIVpBAk8e/SE4dr5WwxLNuXhdkFZ7qr/yDbCNIJoXJrB4QOzEmSAloEWmAuyEQZgmmHhgpxGUAzIiJ33X05JCiVhgjRzm55iiAyEpA9QzOA0AKQgxm8SPNWB+CDNIGBrzw6m0TWjuODOzi4Uzd2nLqG4ptRMD85XcS+Dex3MQNeMohONg6wZxQXEGISuGaQHAH4ilhEqqZLkAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame30 [
	"Private - Generated method"
	<script: 'self frame30 inspect'>
	^ self icons
		at: #frame30
		ifAbsentPut: [ Form fromBinaryStream: self frame30Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame30Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/30_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAFFJREFUOE9jZKAQMFKon2HUAIbRMGCgRxgsOZT8P8ZuLs4EhzclgjSDkjrJBtzZ2QXWuPHHZXBW8efQBdMq7mUYFuJ0AcwQWGbDphkkR3FmAgBQWhMRzSaXpAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame31 [
	"Private - Generated method"
	<script: 'self frame31 inspect'>
	^ self icons
		at: #frame31
		ifAbsentPut: [ Form fromBinaryStream: self frame31Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame31Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/31_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAKhJREFUOE9jZKAQMFKon2HUAAY6hEHX1j3/QTFV5u2CNcBxxsKSQ8lgjQdP2YFjenZJPOkG6MmJMCw7+JBBR5EbbEiM3VwMQ/C6AGZAlL08w6VHb0gzoHdj7H9jZWGGHWdfgF3w8v0vhmL/xcS7AORkkCGwpI5NM0gOqxfu7OwCa5zz4hyDqAArw+sPvxlSJIzAZqm4l6HowRkGMEOQMxu6ZpwuICWHAgA9QDcRJOI8WgAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame32 [
	"Private - Generated method"
	<script: 'self frame32 inspect'>
	^ self icons
		at: #frame32
		ifAbsentPut: [ Form fromBinaryStream: self frame32Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame32Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/32_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAANBJREFUOE9jZKAQMFKon2HUAAb8YdC1dc//Mm8XRhiNLcDxBiJII0jT7etPGWaXxGNVi9eA1J6FYANAgGgDlhxKBmuKsZsLNrxiYcT/jvgVOC3CkAAZoCcnwnDp0RuwzVfuf2WAGYBuOEgeq8m9G2P/u+pLMbz78pNhx9kXDDqK3GDDYAbDXIfTAJAEyBAQ/frDbwYPYwkGIR52ht0XnzEU+y9GsRTDBXd2dsEDbs6Lc2CbRQVYwbQ/hy6YVnEvg+vD6gVkQ9DjHlkzXi8Qm0sBQMhLEZc8lskAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame33 [
	"Private - Generated method"
	<script: 'self frame33 inspect'>
	^ self icons
		at: #frame33
		ifAbsentPut: [ Form fromBinaryStream: self frame33Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame33Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/33_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAQ5JREFUOE9jZKAQMFKon4F2BnRt3fO/zNsFbAEyG93FWF0A0iAoz87w/uFPsHoYG2YgsiFYDUjtWfhfVVMaRfPt608ZZpfEY6jHawBIE8ygs3tvM6zsyyTOAJDVIFeAaJABuDSD5FFMXHIoGawJBGLs5jKGF00H87HZDFMHNwCkWU9OBB4+lx69Ybhy/yuY3xG/ghHdcAwDQAIwQ959gYT+jrMvwLSOIjcDuuEgF2J4ASTQuzEW7GxjZWGwASDNMkK8YIOEeNgZdl98xlDsvxjucpQwuLOzCx4GG39cZhAXZINrPnv3LdgQfw5dBhX3MkwDkDXD/AcyBAZAGpEBzBCMeMVmEDaNWAMRxQoiOQC5TW8RY7i3SQAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame35 [
	"Private - Generated method"
	<script: 'self frame35 inspect'>
	^ self icons
		at: #frame35
		ifAbsentPut: [ Form fromBinaryStream: self frame35Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame35Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/35_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAF5JREFUOE9jZKAQMFKon2HUAIbRMGCgdRgsOZT8H5RSY+zm4kxwOCVAmmWEeMEp/cm7zzgNwWrAnZ1d/09w3gRrfvn+F5j259BlUHEvw1CP0wUgQ5AzGjbNIHmKMxMAQR4YEVQXlVQAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame36 [
	"Private - Generated method"
	<script: 'self frame36 inspect'>
	^ self icons
		at: #frame36
		ifAbsentPut: [ Form fromBinaryStream: self frame36Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame36Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/36_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAIVJREFUOE9jZKAQMFKon2HUAIZhHwa9G2P/g9JJsf9inNGNUwKk2VVfiuHdl58MZ+++xWkIVgOQNYNc8OTdZ4aX739hNQSnAcbKwvBUDnLB6w+/GTriV2CoxxC4s7ML7O+NPy4ziAuygW0GaU6RMAIbqOJehqIHqwtghqBnNHTNIHmKMxMAFco2EZeHUmMAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame37 [
	"Private - Generated method"
	<script: 'self frame37 inspect'>
	^ self icons
		at: #frame37
		ifAbsentPut: [ Form fromBinaryStream: self frame37Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame37Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/37_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAKpJREFUOE9jZKAQMFKon2HUAAYahkHvxtj/yDFU7L8Ya4BjFQRpdtWXYnj35SfcjLN33zJgMwTDAGSbxQXZwAa8fP8LbhC6ISgGINsMshEZGCsLg7noLsFqwO6Lz8CKkTXB+AQNgNkK0wzjgzS+/vAbzO2IXwG3GMUFd3Z2gUN+zotzDFH28iiBuOPsC4YUCSOwASruZdgNgNkGMghkCDIAaUbWCJOjODMBAEisTRHayFWoAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame38 [
	"Private - Generated method"
	<script: 'self frame38 inspect'>
	^ self icons
		at: #frame38
		ifAbsentPut: [ Form fromBinaryStream: self frame38Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame38Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/38_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAQ9JREFUOE9jZKAQMFKon2EQG9C7MfY/sveK/RdjdS1WQZBmV30psP53X34yPHn3meHl+18M2AxBMQDZVmNlYbgDYAaABF5/+M3QEb8Crg/OgNkKshEEdpx9weBhLAG3HeQiZDmYISguqFgY8R+m6cr9rww6itxgw0BskDjMYKwuAGmGuRmkEaQJGaCLobgApDnKXh7sRJDTYYqRXQATExVgZRAXZANbADIE7AVkpyM7GRR4ICAjxAs2GKQZBmCBCTcA3fkwF8HEYQbcuvSfQVDuD1gY7gKYojs7u/53n7oE5oIUgQwBgWUHHzK8f8QCZpea6TGouJdhRiN6pkpvjvkPswmkeWbtEuJTIrph+PgAU66cEVi0GOEAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame40 [
	"Private - Generated method"
	<script: 'self frame40 inspect'>
	^ self icons
		at: #frame40
		ifAbsentPut: [ Form fromBinaryStream: self frame40Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame40Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/40_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAJ9JREFUOE9jZKAQMFKon2HUAAYah8GSQ8n/Y+zm4g1oFElkDSC2jBAvw5N3nxlghmAzEG4AsgaL7+oMJzhvMrx8/wucTPw5dMF8kIFn775lKPZfDNcHZtzZ2fUfXQN6AkOXV3EvA+uFmwQyBKYJpBjZ7yDXgVwFAzDNKAbAJNH9DuOjOx2mHsMF2PyOHBYgjThdgOwNXJkMWTNWL5CaOwFLwV4RnvY71gAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame41 [
	"Private - Generated method"
	<script: 'self frame41 inspect'>
	^ self icons
		at: #frame41
		ifAbsentPut: [ Form fromBinaryStream: self frame41Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame41Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/41_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAANtJREFUOE9jZKAQMFKon4H2Biw5lPw/xm4uToswJJA1gNh6ciIMlx69YYAZgm4gigHoGkB8GSFehrN33zIU+y9mxGYghgHIGno3xv43VhZGMQBZHhQBKAagawDxxQXZGF6+/wV2Abo8VgNgGgjRIAPhBtzZ2fUfxNn44zI4WYA0wwIPZDs6H6TGn0MXrBbuBWRDQBpgfgUpPMF5E85H1qziXsaINX6x+R05LJBTL4YBIJeAvALTAHIBOh9kM8wQFANg3oCFB8yf2PgwQ7B6Adkg9MyGbDtGNJKTMwGmtrIvIPKT/wAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame42 [
	"Private - Generated method"
	<script: 'self frame42 inspect'>
	^ self icons
		at: #frame42
		ifAbsentPut: [ Form fromBinaryStream: self frame42Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame42Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/42_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAYVJREFUOE9jZKAQMOLTv39lyH+Q/Me37xkCsvZiVYsiiKyBX1iQwcQzB2w+I9MDhj2LFjOAxNANhBsA0oyuwcrblIFLWIPh29sbDFdP3MEwEOQquAEbpjn/R9ZwbOtpBpe4WLBmkCEgF6DLYxiArGHm3r0M4oJsDAFGtgwbzh1mePn+F0O6szOKgSgG9G6M/R9rIA227fTWLXC/ftFRYJB+/hHOh1my+MJThmL/xQgvVCyM+K+jyA1WjBwWIMPQwwZk6JX7Xxk64lcgDABZATLE4utrDL+i+337W0mGmbVLwOEHJu7s7ALH95wX5xhABqAHHjofZECpmR4kimEJCWbIxh+XGUBhAQKvHnxkWPLgPUORgwI8OkF+9+fQBcuruJehegEkCApMUOi7yYsy7Hr4GuxXUNgg80F+h1mMkTxBLuk+dYnB1p4drDlFwgjsNZAhhw/+BDsdZDNWA2DeABmgpsfI8PrDb7gBogKsDLcu/Yf7HWYI1gwCMwhbRkO2HSUQyc3VANgC7C/u0a4gAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame43 [
	"Private - Generated method"
	<script: 'self frame43 inspect'>
	^ self icons
		at: #frame43
		ifAbsentPut: [ Form fromBinaryStream: self frame43Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame43Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/43_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAATtJREFUOE9jZMADNkxz/g+SfvqEgyG7bSsjNqUogsgapGV+MLjExYL1fHt7g2H1zMsMIDF0A+EGgDSja7B3l2MQU+BnePXgI8Odq7cwDAS5Cm7A1Crv/8gaDu58xBCargvWDDIE5AJ0eQwDkDX0195miE4Wg7tg6dxXDIXNqigG4nTBsa2n4X4F2QpyPszvMEtALkQxoDIu+D/IBpBm5LBA54O8AjIE5ML2RWsRYQCyAWSIjMwPDL+i+/3JEw6wZpAelGiEGYAeeOh8DAPu7OwCJ5i5S08yEOuC5GhzcLjAXQAzZOfBgxjRh+4Cd3t7sGYV9zLUMIAlVVCaAGkCBRgopNH5yEkaI32DXAJzBcgAkG3ofJDNMENQDED2BijkQXENMwCZD3M+RizATIUZhC33IduO0wB8WRxdDgAfNgI+AftYsgAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame45 [
	"Private - Generated method"
	<script: 'self frame45 inspect'>
	^ self icons
		at: #frame45
		ifAbsentPut: [ Form fromBinaryStream: self frame45Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame45Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/45_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAHtJREFUOE9jZKAQMFKon2HUAAYahkHFwoj/oBjqiF/BuORQ8v+X738xFPsvxgh0rLEA0gzSCDIAxBYVYAXHNtkGwAzDlmYIuoBQQsOZkJC9gc8QvCmRGEOwGnBnZxc4Bua8OMeQImEEdoCKexlWtThdADMEn2aQHMWZCQBL8DIRUe/MgwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame46 [
	"Private - Generated method"
	<script: 'self frame46 inspect'>
	^ self icons
		at: #frame46
		ifAbsentPut: [ Form fromBinaryStream: self frame46Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame46Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/46_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPpJREFUOE9jZKAQMFKon2GIGbDkUPJ/kJdj7ObCXY7ihd6NsWAFyKDYfzFYDUiznpwIw6VHb7AbANIMU4xsAMxQY2VhBiEeduwG4NIMMwjZZeiWgJ2Hz4CKhRFgb3XEr8AaY2BBkCJsCnbVhKCEiVvLGgxD4Aag2wLSbGKnDPbFzUuPGQSE2Bke3/vMgG4I3ESYU2H+drr9hwFkwMsnrxg+vPsJNuDU4R8M8fOXo7gChYNsiOYBRgYzWw6weSCbZZV4CRtwZ2cX2M9zXpwDawQZggysIwzBXBX3MuwJCRagogKsDK8//GZIkTBCMQBZI0wCI1QJRRt6SgUA+QRtEd2NR2oAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame47 [
	"Private - Generated method"
	<script: 'self frame47 inspect'>
	^ self icons
		at: #frame47
		ifAbsentPut: [ Form fromBinaryStream: self frame47Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame47Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/47_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAUpJREFUOE9jZKAQMFKonwHFgN6Nsf9xGVjsvxiudsmhZLg6uCA+zTBDQYaANOvJiYCFLj16A3EBTPPrD78ZOuJXYHgL2XBjZWGwZiEedogBhDTDbIepExdkY3j5/hdYGOQiuAHIfkQPh4qFEf9FBVjhmpDlwQbgcjpIIUgzTAM27zHCFKBL7qoJgWvcp8rC4HT7D9xit5Y18HCCGwCShRkC0mxipwzWcObQXQYQG0TLKvGCxU4d/sEQP3852BAwkd4c819QDmEDyDaYJhD98skruEYzWw5UA+7s7AI7tfvUJbgTg3/+ANv2+N5nuK0wmyWlfzM8f8qK6gKYIXNenAMbonmAkQFmE4gGAZBhII1YDYCFto4iN1gxKJ5FNiC8hB6t1hGGDCruZYgwQDfg8MGfDKVmeuj64HyYZnggIsf3+0csDDNrlxCdSwEd4ahpzjwDNQAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame48 [
	"Private - Generated method"
	<script: 'self frame48 inspect'>
	^ self icons
		at: #frame48
		ifAbsentPut: [ Form fromBinaryStream: self frame48Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame48Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/48_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAXFJREFUOE9jZICC3o2x/2FsZLrYfzEjjL/kUDJcTYzdXLA4mMClGaYRZAhIs56cCFjo0qM3DHADkDUj24ZusLGyMFizEA87w7KDDxk64ldAXFCxMALuLJggzGaYnKgAK4O4IBvDlftfwVLI6lAMgEnuqgmBG7pPlQUeJE63/4DZbi1r4OGCYgBMgYmdMsOZQ3cZQDQIvHzyCkw/vveZQVaJl+HU4R9gfvz85Yxgk0BOBWmGacCmGeYMkGYzWw4wF8SGOwXkbJABINtgNmGLVrwGgJyH7FSaGgBy5fOnrKheINYFktK/wY6DG3BnZ9f/e4dPgUMYlxdANsI0wQw4c5WXgRGkec6LcwygxCKyARLPoFAGBRZMISwsQBpMtD8zgGgQCMvQhKREHUVuhpfvf8HD7OcCROLBFpDsCX/gKRNuALLCwwd/MpSa6WHTy9B96hKDrT07WA6UtDGS8vtHLAwza5fA0wc2U9KbY/4LykG8CwDCa8p4MPGJ0QAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame50 [
	"Private - Generated method"
	<script: 'self frame50 inspect'>
	^ self icons
		at: #frame50
		ifAbsentPut: [ Form fromBinaryStream: self frame50Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame50Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/50_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAGZJREFUOE9jZKAQMFKon2HUAIYREwYHrhT8f/LuM0OM3VyMaMeaDpA1LDmU/B+W2Ig2AFkTSDM2jTBD8aZEmEEkG3BnZxfY2Rt/XAZb5M+hC6ZV3MuICwOQYpghMKdi0wySozgzAQA8ByURkvcnjAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame51 [
	"Private - Generated method"
	<script: 'self frame51 inspect'>
	^ self icons
		at: #frame51
		ifAbsentPut: [ Form fromBinaryStream: self frame51Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame51Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/51_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAJ1JREFUOE9jZKAQMFKon2HUAAY6hcGSQ8n/QbEVYzcXI9AxBNAVg/gyQrwMZ+++ZSj2X0ycASANT959Znj5/hc8mWDTDJLEmg5AthKjGacBMGt7N8aC/Y7LdoIGbFrS9v/1o5cMyVUTcaZYDIk7O7vAtl57/YfBztuY4d2rTwz71x5hsDeWBjtMxb0MRQ9Wk2GGoGc0dM0EvUBMTgUA7rw8EWj0wfUAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame52 [
	"Private - Generated method"
	<script: 'self frame52 inspect'>
	^ self icons
		at: #frame52
		ifAbsentPut: [ Form fromBinaryStream: self frame52Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame52Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/52_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPtJREFUOE9jZKAQMFKon2GIGNC7MfY/zKvF/otRXI3CwaYQJGasLAzWf/buWwaCBqArBhkgLsjGICPEy7Dj7AuGjvgV+F0AMuDJu89gG1++/8UA0gwCV+5/xdAMEseIhYqFEWD/6ihyw2P48MGfDDNrl2CNMZzRCDIIZAg+zVhdALMWZICoACvDrUv/cdqO04BNS9rA3nj96CXcG8lVEwl74c7Orv/XXv9hsPM2Bmt89+oT3IB1s/YxBLgpMqi4l2GPBZBmkOqDZ58yBGd6oWh+9vgFw4nt18AGgACyIXDTYAbADIFZ/f7tLzATphmnATANyAah51R054PkAaxscRFBgrjzAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame53 [
	"Private - Generated method"
	<script: 'self frame53 inspect'>
	^ self icons
		at: #frame53
		ifAbsentPut: [ Form fromBinaryStream: self frame53Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame53Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/53_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAARRJREFUOE9jZKAQMBKjv3dj7H+YumL/xSh64BxkRSDFMIUgcWNlYbD+J+8+M1y5/5WhI34FXB+Yga4IJAZSKCrAygDSDNKIDJANQTEAm0IdRW6wXpAmZDbMFWADKhZG/EeWBInB+CD24YM/GWbWLmEEqQPxMbwAMwRZEmYoTDOuwMYZC4PDAFAs3Lr0H+x/krywaUnb/9ePXsL1vH/7i6GkdzpWQzAEQZodAxIZ/v6+BDbg3atPYHrdrH1YDYEbcGdn1/9rr/8wwDTDNMKc8ezxC4YT268xBLgpMqi4l6GmRJBmkMKDZ58yBGd6wW1F1gxiwwwAsWGGgE2CGQAzBD3AQGEAAiDbYQDFAHRDcIU4ss0wNQDdR6gR9rZFjwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame55 [
	"Private - Generated method"
	<script: 'self frame55 inspect'>
	^ self icons
		at: #frame55
		ifAbsentPut: [ Form fromBinaryStream: self frame55Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame55Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/55_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAG5JREFUOE9jZKAQMFKon2HUAIbRMGCgdRgsOZT8H5RSY+zm4kxwKBJ3dnaBNYDACc6bDKY3zBme3H7C8Nz3KYPFd3V4qldxL4Prw2oyyCCQASDw8v0vMO3PocuArBFmGk6nIbsGpBibZpA4xZkJALcNHhF4vZ7OAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame56 [
	"Private - Generated method"
	<script: 'self frame56 inspect'>
	^ self icons
		at: #frame56
		ifAbsentPut: [ Form fromBinaryStream: self frame56Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame56Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/56_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAJZJREFUOE9jZKAQMFKon2HUAIZhHwbr08v+g9JJ4MwunNGNUwKk2dLPjOHj03cM187ewWkIVgN6N8b+F1slzGBmrwVOqKcOXmN4FfaWodh/MYZ6FIE7O7vATt744zKDsbIww+N2SEIHaX794TdDioQRmK/iXgbXh2EisiHigmwML9//wqkZZBhWL8AMQc9oyDbD5CjOTABynjcRswwgQwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame57 [
	"Private - Generated method"
	<script: 'self frame57 inspect'>
	^ self icons
		at: #frame57
		ifAbsentPut: [ Form fromBinaryStream: self frame57Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame57Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/57_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPVJREFUOE9jZKAQMFKon2E4G7A4uuA/LHyev2dgKNs2Aat3sQqCNLtG2TDsXnaEAUSDwKKpR7AagmEATPPVA5cYnj37xCAlxQc2QEZVhmHjhmsYhmAY0OVV8N8/QIvh1MFrKDFsZq9FvAGSggxwp398+g5sEMhAbGGB4oLejbH//84UZoAZANOMbABz+luGYv/FcH0YBogLsjE86+BlAHkDGYD8L1XxmeHl+1/4DYBpArkEGYBsfv3hN1ioI34Fdhfc2dkFjvs5L84xRNnLM7z78pPhybvPYE1X7n9lSJEwArNV3MuwGwCSRDYE2QXYNIPkKc5MAFT0cBGhF0atAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame58 [
	"Private - Generated method"
	<script: 'self frame58 inspect'>
	^ self icons
		at: #frame58
		ifAbsentPut: [ Form fromBinaryStream: self frame58Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame58Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/58_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAQ1JREFUOE9jZKAQMFKon4H6BiyOLvj//D3EXWXbJoAtwCYGczmKC0AKXaNs4L5aNPUIg6QgAwNM7OPTdwwbN1yDGwxSCDcAWTNIIQicOniNwcxeCyOYkA3BMABZs5QUH1yzjKoMnI1iAMhmmAzMNpDN2ACyPCycGJGdvnvZEbA+5HBANggmDzMI5BKwAcgmIwcYNlcghwuGAfgCDiaHHC5nr36CxEKXFyQcjLUhgfbs2ScGZIXoYiCNsHTCeGdn1/85L86BBYRWShCVst+FvwCrS5EwgrgAZAhMZ/epS2CmoNwfBh1FbjD7yv2vDO8fsYDZpWZ6cEtU3MsYUVIiukEgQ0AApBldI8wUijMTAAKljzurI0OQAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame60 [
	"Private - Generated method"
	<script: 'self frame60 inspect'>
	^ self icons
		at: #frame60
		ifAbsentPut: [ Form fromBinaryStream: self frame60Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame60Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/60_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAGxJREFUOE9jZKAQMFKon2HUAIZhHQZLDiX/f/n+F0Ox/2K8UY1Tsndj7H9QIgMZgM8wvKbDDIGlVmyuIWjA6w+/GTriV+BUh1Xizs4usPPnvDgHtjxFwghMq7iXYajHaTLMEJjzsWkGyVGcmQDABSgR8V1oegAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame61 [
	"Private - Generated method"
	<script: 'self frame61 inspect'>
	^ self icons
		at: #frame61
		ifAbsentPut: [ Form fromBinaryStream: self frame61Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame61Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/61_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAK9JREFUOE9jZKAQMFKon2HUAAYahEHFwoj/ogKs4Mgp9l9MMJAxFIAM0FHkBhvw8v0vsCG9G2P/g/ivP/xm6IhfgaIHqw0gQ0AaYC4RF2QDG3jl/lfiDIAlLphBMD667SBxvH4EGfD+EQvDzNolONXhNaAsd9X/Tx++MMxYnES8AXd2doH9P2uLAoOWgRbDs0dPGB7de8ZQEvMG7BMV9zLCgQgzBD2joWsmGAbE5FQAPvk7Ea6SzOgAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame62 [
	"Private - Generated method"
	<script: 'self frame62 inspect'>
	^ self icons
		at: #frame62
		ifAbsentPut: [ Form fromBinaryStream: self frame62Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame62Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/62_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAOpJREFUOE9jZKAQMFKon4F6BlQsjPgPc01H/AqiDYYrBBngYSwBNmPH2RcMxBqCYcCTd5/Bhly5/xVuCD7XoRigo8jN8PL9LwZxQTa4ATCXgQxGNhTmXRS/ghSjG4LMP3zwJ8PM2iUoejACC+ZcUQFWeAzfugQJX3TNIDGcoQ0yCGQISDM2jVi9gJyoKDYgI3YePF3MWJyE06UoEnd2doE19SwRYbBwMGN49ugJ2FHXzt9iaMj+AWaruJdhD0SYZpgBckpScB8hG4BuCNw0ZANghoDoLx+/wG2HmYjsCgy/oRuEHLDozgfJAQCGWHsR66FESQAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame63 [
	"Private - Generated method"
	<script: 'self frame63 inspect'>
	^ self icons
		at: #frame63
		ifAbsentPut: [ Form fromBinaryStream: self frame63Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame63Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/63_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAARNJREFUOE9jrFgY8Z8BDXTEr2BEF8PFZwQZ4GEsAZZ/8u4zmL5y/ysDuiG4LIIbcPbuW7BmcUE2DEPwWQI2QEeRG+7Cl+9/gQ2BuQKmGeQ6kBzMEpg82K/YDAGJv/7wm0FUgBVsIMxgmE2HD/5kmFm7hBEeWOh+BGlEBjCvgcRgmkFsnKGd3hzzX1DuD9gFty6hRhTIZpjhBA14/4gF7FSc0YhLAuaCgTMgI3Ye2ONfPn5hWLIpjzQvgDRbOJiBfffs0ROGa+dv4TQEbvKdnV1gG3uWiDCANIM0IgOQIQ3ZP8BCKu5lqLEA0wwzQE5JCiNskQ1ANgRsErIBMENgJoDCAARgtsPEYa7A8AKuaEXXCOMDAOnzpxE2GBH9AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame65 [
	"Private - Generated method"
	<script: 'self frame65 inspect'>
	^ self icons
		at: #frame65
		ifAbsentPut: [ Form fromBinaryStream: self frame65Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame65Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/65_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAI5JREFUOE9jZKAQMFKon2EkGLDkUPJ/GSFeBgedCVi9izMMKhZG/AcFsI4iNzicY+zmEm8ASHNH/AqwBmQ2thhDMfXAlYL/T959Zrhy/ysDzABC0YxiAMi/IA1kG4BsGyGnw9TiDURivIFiwJ2dXWAvgMCcF+cYUiSM4I5ScS8jPhaQDQKZgEszSG7g8wIAoAg0EQWU9oMAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame66 [
	"Private - Generated method"
	<script: 'self frame66 inspect'>
	^ self icons
		at: #frame66
		ifAbsentPut: [ Form fromBinaryStream: self frame66Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame66Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/66_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAMNJREFUOE9jZKAQMFKon2GQGlCxMOI/zGsd8SvArlxyKBksFmM3F4WP4QWQZpgmkAYQX0eRm0FPToTh0qM3KAaAxDBMRzcgtWfhf3uzQ2AHwWyHuQjFAJgNV+5/ZYC5AKRZTEqY4dWztwyzS+IxXAvyFtwFIAPeffnJsOPsC7gBIJtAhmDTDAsjuKmwQAJJILuCUDrBmQ7QwwKXQdQz4M7OLnjcg2yb8+IcQ4qEEYbFKu5lKJaicNANQdeNrhkkP/B5AQB262Tx0C9A7gAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame67 [
	"Private - Generated method"
	<script: 'self frame67 inspect'>
	^ self icons
		at: #frame67
		ifAbsentPut: [ Form fromBinaryStream: self frame67Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame67Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/67_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAASlJREFUOE9jZCACLDmU/B+mLMZuLiOyFhQOSKJiYQRccUf8CkaQZj05EbCeS4/eMOA1AKQZpAlmA4ivo8jNICPEyyDEw47fAHTNIENSexb+tzc7BHcxuu0gCbATQRLoBoA0m3koMZzacY9hdkk8hldhpjJeelD+H+S3K/e/MoCcD9IIkgRp/vgaEhw3z94H09gMYjxwpQCsasfZF3ADkDXDbDq9+SrDyr5MDJeAvQAKJJgBML+rGyvC/Y5LMzgMQATIEJAXQODta08GmGaQRlNfbbA4ThcgJwpQQIIM+PTsG1gY5OTwounwdIHVC+gJET0hEUqoKIFyZ2cX2LY5L87B9aVIGMHZKu5lmIEIk4VpxmcASA7dEKwuwOVsvC4g5Fdc8jiTKLEGAgBsfJcRtqTQJgAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame68 [
	"Private - Generated method"
	<script: 'self frame68 inspect'>
	^ self icons
		at: #frame68
		ifAbsentPut: [ Form fromBinaryStream: self frame68Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame68Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/68_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAXNJREFUOE9jZEACvRtj/yPzi/0XMyLzlxxKhsvH2M0Fy8EVIGuGaQSJwdggzXpyImDzLj16w4BhQMXCiP+iAqwMyLam9iz8P7sknhFkkLGyMFizEA87bgNACjriV4BdBdJs5qHEsGfeFQYz+2NgzeKCbGAaZjuKF0AugPn37WtPBpBmEPj4+j/D6c1XGVb2ZaKEB0wt3DaYgLDodgZcBoBc9enZN7BSmIEozgVJnNpxD8V2mME3z95nUDdWBHORXcQICt2Dp+zAmkDOBQF+UUY4GzkaQez3zz8x3DnzGOECkAEyQrwMS3cYwm1A1wTTCKKRNYMDEWbAk3efGUAugTkT2RCQrdg0w2MBmzeQbUU2DMMFMElQCMNsh/kTJqdiIgs3A6cB4UXT/5v6asMDSUDwKFzTh/fWDDBDsBpwZ2fX/+qdvHANyJphgiBDYKDV/TODinsZIjOBDEAP+e5Tl+BCpWZ6GBGDYgBMFptB6DphGmHiAEUZ0BEppP95AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame70 [
	"Private - Generated method"
	<script: 'self frame70 inspect'>
	^ self icons
		at: #frame70
		ifAbsentPut: [ Form fromBinaryStream: self frame70Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame70Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/70_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAGdJREFUOE9jZKAQMFKon2HUAAY6hMGSQ8n/QTEVYzcXa4DjjQWQZphGZDZy1BMdjWQbQJEXejfG/i/2X4zXlXglKTLgzs4ucOhv/HGZwZ9DFxxuKu5lGBbidQHMEFyaQeJExwKuXAsA1tcnEWRDqa8AAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame71 [
	"Private - Generated method"
	<script: 'self frame71 inspect'>
	^ self icons
		at: #frame71
		ifAbsentPut: [ Form fromBinaryStream: self frame71Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame71Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/71_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAMxJREFUOE9jZKAQMFKon4E+Biw5lPwf5tIYu7kolhJ0AUgzsiZ0Pl4D0BWDXAESe/n+F4O4IBsDyGC8BqQ3x/yfWbsERQ3MAJBhxf6LcRsA0iwo94fh/SMWBpghsLBA9hJOF8AMANkEMsTWnh0e4zgN6N0YCw5tkNNANDZD8MYCyABQ4MACCWTI4YM/wTajhwXMORhegLkCZhDMNbhSLN5YgBmG7C10g7AacGdnFzzlbfxxGazHn0MXTKu4lxGfEpENwqYZJEYwKRPKrQA6G18RBz3W5gAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame72 [
	"Private - Generated method"
	<script: 'self frame72 inspect'>
	^ self icons
		at: #frame72
		ifAbsentPut: [ Form fromBinaryStream: self frame72Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame72Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/72_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAARVJREFUOE9jZKAQMFKonwGrAUsOJf9HNzjGbi7jq4cV/8XkO1D0YBgA0gxSjGwAzECD/2xgYR376XB5DAPSm2P+z6xdQpTBIMNQFII0q+kxMty69J8B3RBsLsNqgKDcH4b3j1hQDIB5Ad1rOA0QFWAFu8LWnh3s55fvfzEU+y9m7N0YCw5cEBsWRnDGlYOZYMnJhz4zgFwBMwQkBvMOyABjZWGGs3ffwg1BCQOQAnFBNobta34zyBr/gkfE47NsDEsnLQKrRXcFiiBIAcgAEAAZAgMwzdgSHdhfyM6C2YDuV1wpFiVg7uzs+r/xx2UUtf4cunC+insZRvqAC4A0w1SSYgiKiciGYHMyXhcga0A3CJtGmHoAFZaKEaEqs/UAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMFarmingPlants class >> frame73 [
	"Private - Generated method"
	<script: 'self frame73 inspect'>
	^ self icons
		at: #frame73
		ifAbsentPut: [ Form fromBinaryStream: self frame73Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMFarmingPlants class >> frame73Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Farming Plants/73_Farming Plants.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAATtJREFUOE9jZKAQMKLrX3Io+T82M2Ps5sLVvnpY8V9MvgPMJ9oAkGKQISDNXz/8ZFDU78c0AGY7sm0gjciuMvjPBnegjv10RhQXpDfHwJ0/s3YJihwuw+GKQJoF5f6ATRcVYGW4dek/A8wQZBeguw6vAbb27Bjh+fL9L7BYsf9i1DCIzov7L2sMkUR2hZoexA5xQTZwIPZujP0PYoMMAhmC4k9choAMgHkHZoCMEC/D2btvUaMR3QCYS0A0cpiADIG5FOwCZIFzexkZkL0CU/j+EQvcFcgBA/aTsbIww5N3n8H+Avlv+5rfYDXIBj0+y8awdNIijISHESiwKAMZBnINDGDTDE7KMOeDQvTOzq7/Jzhvgl2CDPw5dMFcFfcyTBfAFII0w9gbf1zGagA2Q1BMRDYEPQVhsx2kBgCzj6NFQRWjcQAAAABJRU5ErkJggg=='
]

{ #category : 'accessing' }
CMFarmingPlants class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : 'InspectorExtensions' }
CMFarmingPlants class >> inspectionIcons [
	<inspectorPresentationOrder: 0 title: 'icons'>
	<script: 'self inspect'>
	^ SpTablePresenter new
		  addColumn: (SpImageTableColumn title: 'Icon' evaluated: #value);
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		  items:
			  ((self class selectorsInCategory: 'accessing - icons') sorted
				   collect: [ :each | each -> (self perform: each) ]);
		  yourself
]

{ #category : 'accessing - reset' }
CMFarmingPlants class >> resetIcons [
	<script>
	^ icons := nil
]
