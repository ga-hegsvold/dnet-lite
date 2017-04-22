FILE = dnet-lite

$(FILE).pdf: $(FILE).fo
	fop $(FILE).fo -pdf $(FILE).pdf; rm $(FILE).fo; acroread $(FILE).pdf

$(FILE).fo: $(FILE).xml
	xsltproc -o $(FILE).fo \
	--stringparam fop.extensions 0 \
	--stringparam generate.toc 0 \
	--stringparam section.label.includes.component.label 1 \
	--stringparam chapter.autolabel 1 \
	--stringparam section.autolabel 1 \
	--stringparam paper.type A4 \
	--stringparam hyphenate false \
	--stringparam hyphenate.verbatim 1 \
	--stringparam shade.verbatim 1 \
	--stringparam column.count.titlepage 1 \
	--stringparam column.count.body 1 \
	--stringparam column.count.lot 1 \
	--stringparam body.font.master 8 \
	--stringparam draft.mode yes \
	/usr/share/sgml/docbook/xsl-stylesheets/fo/docbook.xsl $(FILE).xml

clean:
	rm $(FILE).pdf
