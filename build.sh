# !/bin/sh

TOPDIR="$(pwd)"
DOCDIR="doc"
TEXFILES="
otf-unofficial-guide.tex
ajmacros-unofficial-guide.tex
"

cd "$DOCDIR" || exit 1

for TARGET in $TEXFILES; do

    echo "Compiling ./doc/$TARGET ..."
    latexmk -interaction=batchmode -file-line-error -latex="uplatex -kanji=utf8" -e "\$dvipdf = 'dvipdfmx %O -o %D %S'; \$pdf_mode = 3;" -outdir="." "$TARGET" || exit 1

    PDFFILE="${TARGET%.tex}.pdf"

    echo "Moving $PDFFILE to $TOPDIR"
    mv "$PDFFILE" "$TOPDIR"/
done

echo "Clear axually file."
for TARGET in $TEXFILES; do
    latexmk -C $TARGET || exit 1
done

echo "Done."
