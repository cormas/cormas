resources-icons
defineSpaceIcon
	"UIMaskEditor new openOnClass: self andSelector: #imageDefinirEspace"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 32 @ 32
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							((Array new: 5)
								at: 1
									put: ColorValue black;
								at: 2
									put: ColorValue red;
								at: 3
									put: ColorValue yellow;
								at: 4
									put: ColorValue blue;
								at: 5
									put: ColorValue green;
								yourself))
				usingBits:
					(ByteArray fromPackedString:
							'@@@@@@@@@@@@@@@@@@@@@@DQDQ@BH"H @3L3L@L3L3@ADQDP@ @BH@L3L3@CL3L0@QDQD@H@@"@CL3L0@3L3L@DQDQ@B@@H @3L3L@L3L3@ADQDP@"H"H@L3L3@CL3L0@QDQD@H"H"@CL3L0@3L3L@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@QDQD@QDQD@ADQDPADQDP@DQDQ@DQDQ@@Q@@D@QDQD@ADQDPADQDP@DP@A@DQDQ@@QDQD@QDQD@AD@@PADQDP@DQDQ@DQDQ@@QDQD@QDQD@ADQDPADQDP@DQDQ@DQDQ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ADQDP@3L3L@L3L3@DQDQ@@QDQD@L3L3@CL3L0ADQDP@DQDQ@CL3L0@3L3L@QDQD@ADQDP@3L3L@L3L3@DQDQ@@QDQD@L3L3@CL3L0ADQDP@DQDQ@CL3L0@3L3L@QDQD@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@H"H"@ADQDP@3L3L@QDQD@BH"H @QDQD@L3L3@DQDQ@@ @BH@DQDQ@CL3L0ADQDP@H@@"@ADQDP@3L3L@QDQD@B@@H @QDQD@L3L3@DQDQ@@"H"H@DQDQ@CL3L0ADQDP@@@@@@@@@@@@@@@@@@@@@@b'))