all: slow_sum_p.svg

%.svg: %.bob
	svgbob --font-family=monospace --output $@ < $<

%.png: %.svg
	inkscape -z -d 192 -e $@ $<
