"""Linijinės SVG iliustracijos skaidrėms (šviesi tema). Naudojimas skaidres.md: `@iliustracija: pastatas`."""

INK, PAPER, ACC = "#1c1b1a", "#ffffff", "#d9480f"
BLUE, GREEN, YEL, ORG, VIO = "#d0ebff", "#d3f9d8", "#fff1a8", "#ffd8a8", "#e5dbff"
F = 'font-family="Patrick Hand,Kalam,cursive"'
S = f'stroke="{INK}" stroke-width="3" stroke-linejoin="round" stroke-linecap="round"'


def _t(x, y, txt, size=20, fill=INK, anchor="middle", bold=True):
    w = ' font-weight="700"' if bold else ""
    return f'<text x="{x}" y="{y}" text-anchor="{anchor}" font-size="{size}" fill="{fill}" {F}{w}>{txt}</text>'


def _door(x, n, hot=False):
    fill, tc = (ACC, "#fff") if hot else (PAPER, INK)
    return (f'<rect x="{x}" y="150" width="46" height="90" rx="6" fill="{fill}" {S}/>'
            + _t(x + 23, 202, n, 17, tc) + f'<circle cx="{x+36}" cy="206" r="3" fill="{tc}"/>')


PASTATAS = ('<svg viewBox="0 0 400 320" role="img" aria-label="Pastatas su durimis: IP adresas ir portai">'
            f'<rect x="40" y="76" width="320" height="184" fill="{PAPER}" {S}/>'
            f'<polygon points="28,80 200,16 372,80" fill="{ORG}" {S}/>'
            + "".join(f'<rect x="{x}" y="96" width="28" height="28" fill="{YEL}" {S}/>' for x in (62, 122, 182, 242, 302))
            + _door(50, "22") + _door(104, "80") + _door(158, "443") + _door(212, "3306") + _door(280, "5001", True)
            + _t(200, 296, "pastatas = IP, durys = portai", 20) + '</svg>')

KNYGA = ('<svg viewBox="0 0 400 320" role="img" aria-label="Telefonų knyga: DNS">'
         f'<path d="M40 64 L200 84 L360 64 L360 272 L200 292 L40 272 Z" fill="{PAPER}" {S}/>'
         f'<line x1="200" y1="84" x2="200" y2="292" {S}/>'
         + _t(120, 126, "VARDAS", 18, ACC) + _t(282, 126, "IP ADRESAS", 18, ACC)
         + "".join(f'<line x1="62" y1="{y+10}" x2="178" y2="{y+10}" stroke="{INK}" stroke-opacity=".25" stroke-width="2"/>'
                   f'<line x1="218" y1="{y+10}" x2="338" y2="{y+10}" stroke="{INK}" stroke-opacity=".25" stroke-width="2"/>'
                   + _t(62, y, a, 17, INK, "start", False) + _t(218, y, b, 17, INK, "start", False)
                   for y, a, b in ((166, "localhost", "127.0.0.1"), (206, "mano-pc", "192.168.1.20"), (246, "kursas", "10.0.0.7")))
         + _t(200, 38, "DNS = telefonų knyga", 22) + '</svg>')


def _env(x, y, label, fill):
    return (f'<rect x="{x}" y="{y}" width="160" height="104" fill="{fill}" {S}/>'
            f'<polyline points="{x},{y} {x+80},{y+58} {x+160},{y}" fill="none" {S}/>'
            + _t(x + 80, y + 90, label, 18))


LAISKAS = ('<svg viewBox="0 0 400 320" role="img" aria-label="Užklausa ir atsakymas">'
           + _t(80, 28, "klientas", 20, ACC) + _t(320, 28, "serveris", 20, ACC)
           + _env(30, 44, "GET /health", BLUE)
           + f'<path d="M200 96 L330 96" {S} marker-end="url(#a)"/>'
           + _env(210, 178, "200 OK", GREEN)
           + f'<path d="M204 230 L80 230" {S} marker-end="url(#a)"/>'
           + f'<defs><marker id="a" markerWidth="9" markerHeight="9" refX="5" refY="4.5" orient="auto"><path d="M0 0 L9 4.5 L0 9" fill="none" stroke="{INK}" stroke-width="2.5"/></marker></defs>'
           + _t(200, 306, "užklausa → atsakymas", 20) + '</svg>')

SERVERIS = ('<svg viewBox="0 0 400 320" role="img" aria-label="Serveris, kuris klauso porto">'
            + "".join(f'<rect x="80" y="{y}" width="240" height="62" fill="{BLUE}" {S}/>'
                      f'<circle cx="112" cy="{y+31}" r="8" fill="{GREEN if k else ORG}" {S}/><circle cx="140" cy="{y+31}" r="8" fill="{GREEN}" {S}/>'
                      f'<rect x="184" y="{y+22}" width="104" height="18" fill="{PAPER}" {S}/>'
                      for k, y in enumerate((50, 124, 198)))
            + _t(200, 30, "procesas = serveris", 20) + _t(200, 296, "klauso :5001", 24, ACC) + '</svg>')

RAKTAS = ('<svg viewBox="0 0 400 320" role="img" aria-label="Privatus ir viešas raktas">'
          f'<rect x="40" y="130" width="130" height="110" fill="{ORG}" {S}/>'
          f'<path d="M66 130 V98 a39 39 0 0 1 78 0 V130" fill="none" {S}/>'
          f'<circle cx="105" cy="182" r="11" fill="{INK}"/>'
          + _t(105, 270, "PRIVATUS", 20, ACC) + _t(105, 294, "tik pas jus", 17, INK, "middle", False)
          + f'<circle cx="262" cy="168" r="32" fill="{GREEN}" {S}/><path d="M294 168 H372 M346 168 V198 M324 168 V190" fill="none" {S}/>'
          + _t(300, 270, "VIEŠAS (.pub)", 20, "#2b8a3e") + _t(300, 294, "galima rodyti", 17, INK, "middle", False) + '</svg>')

SAKA = ('<svg viewBox="0 0 400 320" role="img" aria-label="Git šakos">'
        f'<path d="M60 240 H340" {S}/>'
        f'<path d="M140 240 C170 240 170 120 210 120 H260 C290 120 290 240 320 240" fill="none" stroke="{ACC}" stroke-width="3.5" stroke-linecap="round"/>'
        + "".join(f'<circle cx="{x}" cy="240" r="14" fill="{PAPER}" {S}/>' for x in (60, 140, 320))
        + "".join(f'<circle cx="{x}" cy="120" r="14" fill="{PAPER}" stroke="{ACC}" stroke-width="3.5"/>' for x in (210, 260))
        + _t(60, 284, "main", 20) + _t(235, 86, "šaka", 20, ACC) + _t(320, 284, "merge", 20) + '</svg>')

ILLUSTRATIONS = {"pastatas": PASTATAS, "knyga": KNYGA, "laiškas": LAISKAS, "laiskas": LAISKAS,
                 "serveris": SERVERIS, "raktas": RAKTAS, "šaka": SAKA, "saka": SAKA}
