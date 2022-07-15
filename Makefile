cv.pdf:
	cat cv.md | sed -e 's/::/$$\\\hfill$$/' | pandoc -H style.tex -o cv.pdf

cv-simple.pdf:
	cat cv.md | sed -e 's/::/$$\\\hfill$$/' | pandoc -o cv.pdf

clean:
	rm -f cv.pdf cv-simple.pdf

format:
	pandoc -f markdown -s -t markdown --columns=80 cv.md -o cv.md

.PHONY: clean format
