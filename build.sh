#!/bin/sh

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

info_msg() {
    echo -e "${GREEN}[INFO]:${RESET} $*"
}
success_msg() {
    echo -e "${BLUE}[SUCCESS]:${RESET} $*"
}
warn_msg() {
    echo -e "${YELLOW}[WARN]:${RESET} $*"
}
error_msg() {
    echo -e "${RED}[ERROR]:${RESET} $*" >&2
}

TOPDIR="$(pwd)"
DOCDIR="doc"
cd "$DOCDIR" || exit 1

declare -A FILE_MAP=(
    ["otf"]="otf-unofficial-guide.tex"
    ["ajmacros"]="ajmacros-unofficial-guide.tex"
    ["supplement"]="supplement.tex"
)

DEFAULT_KEYS=("otf" "ajmacros" "supplement")

run_latexmk () {
    local TARGET="$1"
    info_msg "Compiling: $TARGET"
    latexmk -interaction=batchmode -file-line-error -latex="uplatex -kanji=utf8" -e "\$dvipdf = 'dvipdfmx %O -o %D %S'; \$pdf_mode = 3;" -outdir="." "$TARGET"

    if [ $? -ne 0 ]; then
        error_msg "Error: latexmk failed on $TARGET"
        return 1
    fi
}

clean_aux_files () {
    local TARGET="$1"
    info_msg "Cleaning: $TARGET's axually files"
    latexmk -C "$TARGET"
}

if [ $# -gt 0 ]; then
    for key in "$@"; do
        TARGET="${FILE_MAP[$key]}"

        if [ -z "$TARGET" ]; then
            error_msg "Error: unknown key '$key'"
            info_msg "Valid keys: ${!FILE_MAP[@]}"
            exit 1
        fi

        run_latexmk "$TARGET"

        PDFFILE="${TARGET%.tex}.pdf"

        info_msg "Moving: $PDFFILE to $TOPDIR"
        mv "$PDFFILE" "$TOPDIR"/

        clean_aux_files "$TARGET"
    done
    exit 0
else
    info_msg "No arguments given. Building default documents."

    for key in "${DEFAULT_KEYS[@]}"; do
        TARGET="${FILE_MAP[$key]}"
        run_latexmk "$TARGET"

        PDFFILE="${TARGET%.tex}.pdf"

        info_msg "Moving $PDFFILE to $TOPDIR"
        mv "$PDFFILE" "$TOPDIR"/

        clean_aux_files "$TARGET"
    done
fi

success_msg "Done."
