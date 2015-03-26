CachedImages hold both a real image and a retained medium (Mask or Pixmap) and can be displayed quickly.  The retained medium is created from the image when needed.

Instance Variables:
	image				<Image>  
	retainedMedium	<Mask | Pixmap>  Mask if image paintBasis == CoverageValue, Pixmap otherwise


Object Reference:
A display surface such as a Pixmap usually can be displayed much more quickly than an equivalent image. However, an image has greater longevity because it survives even after you exit and restart the system. A CachedImage combines the longevity of an image with the displaying speed of a display surface. 
Given an image at creation time, a CachedImage generates an equivalent Pixmap or Mask, known as its retainedMedium. Whenever its display surface is unavailable, usually because the system has been restarted, a new display surface is generated. For frequently displayed images, the improvement in display speed is worth the cost in storage space. For example, the insertion point used by text editors is stored in a CachedImage. 
A CachedImage is created by sending #on: to this class, with the image as the argument. After that, it can be displayed just like any other visual component, though it cannot perform image-specific operations such as magnification and rotation. 
