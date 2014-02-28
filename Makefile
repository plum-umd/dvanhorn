dummy:
	racket dvanhorn.rkt

push:	
	rsync -avz www/ umd:www/

