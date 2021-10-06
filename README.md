# tenpo
## toki pona (English version below)
ilo ni li ilo pi tenpo pi toki pona. ona li pana e tenpo lon toki linja pi ilo sona. nasin ni li tan [lipu Leti ni](https://www.reddit.com/r/tokipona/comments/dr378j/lunisolar_calendar_for_toki_pona_done/). nimi pi tenpo mun ale li tan [lipu Leti ni](https://www.reddit.com/r/tokipona/comments/oikpr8/toki_tan_a_creation_story_in_toki_pona_inspired/). ona li kepeken toki ilo Nim.

kin la, tenpo pini la, [mi pali e ilo sama](https://github.com/AlbeyAmakiir/tenpo-pi-toki-pona) lon toki ilo GForth. ilo ni li tan ona kin.

## pali
wile:
* nim (tenpo ni: 1.4.8)([lipu ona](https://nim-lang.org/))

pali e ilo: `nim c tenpo.nim`
pali e ilo e alasa pona ilo: `nim c tenpoTest.nim`

## alasa pona
pali en alasa pona: `nim c -r tenpoTest.nim`

pona ilo li lukin sama ni:
```
------------------------
| Testing Tenpolib.nim |
------------------------
Test yearHasNamako: Passed.
Test monthName: Passed.
Test daysInYear: Passed.
...
```
taso, ona li suli.

## open
```
$ ./tenpo
tenpo sike  20
tenpo mun   Pipi
```
```
$ ./tenpo -sol 140.5
20/Pipi/3
```
```
$ ./tenpo --help
tenpo pi toki pona
Outputs the current date and/or time in toki pona
Usage: tenpo [flags [longitude]]

Flags:
  -h, --help     this helptext
  -v, --version  version info
  -s             include day number
  -o             one-line output
  -l             expects longitude to follow flags

v: 0.1-alpha
```

## tenpo li ante tan seme?
ilo tenpo ante pi toki pona li pana e tenpo ante. taso, tenpo open pi ilo ni li ante: 2001/03/25 01:21:37 UTC+0. [lipu ni](https://github.com/AlbeyAmakiir/tenpo/wiki/nasin-ni-li-seme%3F#tenpo-sike) li jo e sona mute.

---

# tenpo
## English (nasin pi toki pona li sewi ni)
A terminal-based calendar, based on the toki pona luni-solar calendar found [in this reddit thread](https://www.reddit.com/r/tokipona/comments/dr378j/lunisolar_calendar_for_toki_pona_done/), with month names [from this other reddit thread](https://www.reddit.com/r/tokipona/comments/oikpr8/toki_tan_a_creation_story_in_toki_pona_inspired/). Written in Nim.

Based also on my [previous attempt](https://github.com/AlbeyAmakiir/tenpo-pi-toki-pona) in GForth.

## Building
Requirements:
* nim (Currently 1.4.8)([Website](https://nim-lang.org/))

Build: `nim c tenpo.nim`
Build with tests: `nim c tenpoTest.nim`

## Testing
Build with tests and immediately run them: `nim c -r tenpoTest.nim`

Expected output:
```
------------------------
| Testing Tenpolib.nim |
------------------------
Test yearHasNamako: Passed.
Test monthName: Passed.
Test daysInYear: Passed.
...
```
etc.

## Usage
```
$ ./tenpo
tenpo sike  20
tenpo mun   Pipi
```
```
$ ./tenpo -sol 140.5
20/Pipi/3
```
```
$ ./tenpo --help
tenpo pi toki pona
Outputs the current date and/or time in toki pona
Usage: tenpo [flags [longitude]]

Flags:
  -h, --help     this helptext
  -v, --version  version info
  -s             include day number
  -o             one-line output
  -l             expects longitude to follow flags

v: 0.1-alpha
```

## Why is the date wrong?
If you're comparing to other toki pona calendar tools, note that this one uses a different dateline and slightly different origin time: 2001/03/25 01:21:37 UTC+0. More details [in the wiki](https://github.com/AlbeyAmakiir/tenpo/wiki/How-toki-pona-time-works#calendar).
