# tenpo
## toki pona (English version below)
ilo ni li ilo pi tenpo pi toki pona. ona li pana e tenpo lon toki linja pi ilo sona. nasin ni li tan [lipu Leti ni](https://www.reddit.com/r/tokipona/comments/dr378j/lunisolar_calendar_for_toki_pona_done/). nimi pi tenpo mun ale li tan [lipu Leti ni](https://www.reddit.com/r/tokipona/comments/oikpr8/toki_tan_a_creation_story_in_toki_pona_inspired/). ona li kepeken toki ilo Nim.

kin la, tenpo pini la, [mi pali e ilo sama](https://github.com/AlbeyAmakiir/tenpo-pi-toki-pona) lon toki ilo GForth. ilo ni li tan ona kin.

## pali
wile:
* nim ([lipu ona](https://nim-lang.org/))

pali e ilo: `nim c tenpo.nim`
pali e ilo e alasa pona ilo: `nim c tenpoTest.nim`

## alasa pona
pali en alasa pona: `nim c -r tenpoTest.nim`

pona ilo li lukin sama ni:
```
---------------------
| Testing Tenpo.nim |
---------------------
Test yearHasNamako: Passed.
Test monthName: Passed.
Test daysInYear: Passed.
...
```
taso, ona li suli.

## open
tenpo ni la, ona li ken ala open.

---

# tenpo
## English (nasin pi toki pona li sewi ni)
A terminal-based calendar, based on the toki pona luni-solar calendar found [in this reddit thread](https://www.reddit.com/r/tokipona/comments/dr378j/lunisolar_calendar_for_toki_pona_done/), with month names [from this other reddit thread](https://www.reddit.com/r/tokipona/comments/oikpr8/toki_tan_a_creation_story_in_toki_pona_inspired/). Written in Nim.

Based also on my [previous attempt](https://github.com/AlbeyAmakiir/tenpo-pi-toki-pona) in GForth.

## Building
Requirements:
* nim ([Website](https://nim-lang.org/))

Build: `nim c tenpo.nim`
Build with tests: `nim c tenpoTest.nim`

## Testing
Build with tests and immediately run them: `nim c -r tenpoTest.nim`

Expected output:
```
---------------------
| Testing Tenpo.nim |
---------------------
Test yearHasNamako: Passed.
Test monthName: Passed.
Test daysInYear: Passed.
...
```
etc.

## Usage
Can not be run at this stage.