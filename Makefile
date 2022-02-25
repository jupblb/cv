cv.pdf:
	pandoc -H style.tex cv.md -o cv.pdf

cv-simple.pdf:
	pandoc cv.md -o cv.pdf

clean:
	rm -f cv.pdf cv-simple.pdf

format:
	pandoc -f markdown -s -t markdown --columns=80 cv.md -o cv.md

.PHONY: clean format
