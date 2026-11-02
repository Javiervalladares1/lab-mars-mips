#!/bin/sh
set -eu

REPO_DIR=$(CDPATH= cd "$(dirname "$0")/.." && pwd)
MARS_JAR=${MARS_JAR:-"$REPO_DIR/tools/Mars4_5.jar"}

if ! command -v java >/dev/null 2>&1; then
    printf '%s\n' 'Instala Java y comprueba java -version antes de ejecutar el programa.' >&2
    exit 1
fi

if [ ! -f "$MARS_JAR" ]; then
    printf '%s\n' 'No se encontro Mars4_5.jar. Guardalo en tools/ o define MARS_JAR.' >&2
    printf '%s\n' 'Descarga: https://github.com/dpetersanderson/MARS/releases/tag/v.4.5.1' >&2
    exit 1
fi

exec java -jar "$MARS_JAR" nc ae1 se2 sm dec t0 t1 t2 v0 \
    "$REPO_DIR/src/hello_mars.asm"
