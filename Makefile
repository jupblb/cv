PANDOC_FLAGS = -H style.tex --lua-filter=filter.lua
ifdef EMAIL
  PANDOC_FLAGS += -M email="$(EMAIL)"
endif
ifdef PHONE
  PANDOC_FLAGS += -M phone="$(PHONE)"
endif

%.pdf: %.md filter.lua style.tex
	pandoc $(PANDOC_FLAGS) -o $@ $<

combined.pdf: resume.md cv.md filter.lua style.tex
	pandoc $(PANDOC_FLAGS) -M combined -o .resume-combined.pdf resume.md
	pandoc $(PANDOC_FLAGS) -M combined -o .cv-combined.pdf cv.md
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
