#!/usr/bin/env python3
"""Genera un PDF apaisado 16:9 a partir de un deck `.dc.html` del brand-kit.

El `.preview.html` muestra una slide por vez (las oculta con JS), así que no
sirve para imprimir. Este script extrae las <section> y las apila, una por
página, en un HTML temporal que Chrome convierte a PDF.

Uso:
    python3 scripts/build_pdf.py docs/clases/clase_1_fundamentos_y_gitflow.dc.html

Genera el sibling `*.pdf`. No modifica el `.dc.html` fuente.
"""
import re
import subprocess
import sys
import tempfile
from pathlib import Path

CHROME = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'

FONTS = ('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700'
         '&family=IBM+Plex+Sans:wght@400;500;600;700'
         '&family=IBM+Plex+Mono:wght@400;500;600&display=swap')


def build(src_path: str) -> Path:
    src = Path(src_path).resolve()
    sections = re.findall(r'<section\b.*?</section>', src.read_text(encoding='utf-8'),
                          flags=re.DOTALL)
    if not sections:
        raise SystemExit('No se encontraron <section> en el archivo.')

    slides = '\n'.join(f'<div class="page">{s}</div>' for s in sections)
    html = f"""<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<title>{src.stem}</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="{FONTS}" rel="stylesheet">
<style>
  *{{margin:0;padding:0;box-sizing:border-box}}
  @page{{size:1920px 1080px;margin:0}}
  html,body{{background:#070708;-webkit-print-color-adjust:exact;print-color-adjust:exact}}
  .page{{position:relative;width:1920px;height:1080px;overflow:hidden;
         page-break-after:always;break-after:page}}
  .page:last-child{{page-break-after:auto;break-after:auto}}
  .page > section{{position:absolute;inset:0;width:1920px;height:1080px;display:block}}
</style>
</head>
<body>
{slides}
</body>
</html>
"""
    # el HTML temporal vive junto al fuente para que assets/ resuelva igual
    tmp = tempfile.NamedTemporaryFile('w', suffix='.print.html', dir=src.parent,
                                      delete=False, encoding='utf-8')
    tmp.write(html)
    tmp.close()
    out = src.with_suffix('').with_suffix('.pdf') if src.suffixes[-2:] == ['.dc', '.html'] \
        else src.with_suffix('.pdf')
    try:
        subprocess.run([CHROME, '--headless', '--disable-gpu', '--no-pdf-header-footer',
                        '--force-prefers-reduced-motion', '--virtual-time-budget=20000',
                        f'--print-to-pdf={out}', Path(tmp.name).as_uri()],
                       check=True, capture_output=True)
    finally:
        Path(tmp.name).unlink(missing_ok=True)
    print(f'PDF generado: {out.name}  ({len(sections)} páginas)')
    return out


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('Uso: build_pdf.py <deck.dc.html>')
    build(sys.argv[1])
