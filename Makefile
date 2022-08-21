cv.pdf: cv.md
	cat cv.md | \
		sed -e 's/::/$$\\\hfill$$/' | \
		sed -e 's/\(-\{5,\}\)/$$\\vspace*{\\fill}$$\n\1/' | \
		pandoc -H style.tex -o cv.pdf

cv-simple.pdf: cv.md
	cat cv.md | sed -e 's/::/$$\\\hfill$$/' | pandoc -o cv.pdf

clean:
	rm -f cv.pdf cv-simple.pdf

format:
	pandoc -f markdown -s -t markdown --columns=80 cv.md -o cv.md

.PHONY: clean format
