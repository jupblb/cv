%.pdf: %.md filter.lua style.tex
	pandoc -H style.tex --lua-filter=filter.lua -o $@ $<

combined.pdf: resume.md cv.md filter.lua style.tex
	pandoc -H style.tex --lua-filter=filter.lua -M combined -o .resume-combined.pdf resume.md
	pandoc -H style.tex --lua-filter=filter.lua -M combined -o .cv-combined.pdf cv.md
	pdfunite .resume-combined.pdf .cv-combined.pdf $@
	rm -f .resume-combined.pdf .cv-combined.pdf

clean:
	rm -f *.pdf

format:
	@for f in *.md; do \
		pandoc --columns=80 --reference-links --standalone \
			-f markdown -t markdown "$$f" > "$$f.tmp" && mv "$$f.tmp" "$$f"; \
	done

.PHONY: clean format
