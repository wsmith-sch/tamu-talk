# `tamu-talk` - A Texas A&M theme for `ltx-talk`

## Disclaimer

This package is independently maintained and is not affiliated with, endorsed
by, or sponsored by Texas A&M University in any capacity. "Texas A&M" and its
logos are trademarks of Texas A&M University. For this reason, the logo is
**not** included in this package; if you are authorized to use it, `tamu-talk`
makes it easy to add (see
[Obtaining and Using the Texas A&M Logo](#obtaining-and-using-the-texas-am-logo)).

Beware that `tamu-talk` is a theme for the (experimental) [`ltx-talk`](https://ctan.org/pkg/ltx-talk)
class. As such, its interface is liable to modification as we track changes made
to this class.

## Description

`tamu-talk` is a lightweight Texas A&M theme for the
[`ltx-talk`](https://ctan.org/pkg/ltx-talk) class. It restyles `ltx-talk`'s
slide templates (title page, header, footer) using LaTeX's template mechanism;
see `texdoc ltx-talk` and `texdoc lttemplates`.
`ltx-talk` is a `beamer`-like presentation class that produces tagged
(accessible) PDFs. The purpose of `tamu-talk` is to minimally stylize and
decorate these slides made with this class.

Specifically, the point of this package is to provide the following:

- a stylized, easy to modify title page, with formatting options
- frame headers in three different styles (`banner`, `ribbon`, `plain`)
- (optional) frame numbers in the footer
- several Texas A&M brand colors (`TAMUMaroon`, `TAMUTan`, etc)
- a few named `tcolorbox` environments using these colors for organizing content

We intend to deliberatly keep `tamu-talk` small and limited in scope; however,
bug-fixes and improvements to this code would be appreciated.

## Requirements

- LaTeX 2026-06-01 or newer
- `ltx-talk` 2026-09-10 or newer
- `tcolorbox` and `graphicx`

## Installation

`tamu-talk` is distributed through CTAN. Install it with your TeX
distribution's package manager, e.g. with TeX Live:

```sh
tlmgr install tamu-talk
```

MiKTeX users can install it from the MiKTeX Console.

To install the latest development version from source, use
[`l3build`](https://ctan.org/pkg/l3build) (included in TeX Live):

```sh
git clone https://github.com/wsmith-sch/tamu-talk.git
cd tamu-talk
l3build install --full
```

## Usage

`tamu-talk` works only with the `ltx-talk` class:

```latex
\documentclass{ltx-talk}
\usepackage[header-style = plain]{tamu-talk}
```

Options can also be set later in your preamble using `\SetKeys[tamu-talk]{...}`.
See the documentation (`texdoc tamu-talk`) for a more detailed description of
the various keys and options.

## Obtaining and Using the Texas A&M Logo

Texas A&M makes its logos available to faculty and staff for marketing and
informational material; anyone else needs the university's approval ( c.f.
[logo downloads](https://marcomm.tamu.edu/template/logo-downloads/)).
The logo itself is trademarked and, as such, we do not include it as an asset in
this package. However, we intend to make it as painless as possible to use this
logo in your slides if you are authorized to do so.

The class itself works without the logo. If you explicitly set
`title-logo = true` without having installed this logo, it will show a gray
placeholder with a warning instead. If you are authorized to use the logo, add
it as follows:

1. Download the "TAM Maroon" logo
   ([PNG](https://marcomm.tamu.edu/downloads/?df=1084)), and follow the
   university's [logo guidelines](https://marcomm.tamu.edu/our-brand/logos/logo-guidelines/).
2. Save it as `tamu-logo.png` (you are encouraged to crop it tightly around
   the logo, so that it fills its space on the title page; for the sharpest
   result, export the [SVG](https://marcomm.tamu.edu/downloads/?df=1085) to a
   large PNG and crop that instead).
3. Put it where TeX can find it, using one of these:
   - **Once for all documents locally:** anywhere under `tex/` in your
     personal texmf tree, e.g. `~/texmf/tex/latex/my-logos/tamu-logo.png`.
     Run `kpsewhich -var-value TEXMFHOME` to find that tree on your system.
   - **For one document:** the same folder as your main `.tex` file.
     On Overleaf, upload it to your project's top level.

To use a file with a different name, set `logo-file` as follows:
```latex
\SetKeys[tamu-talk]{logo-file = my-department-logo}
```
and then place this asset in any of the afformentioned locations.

## Bugs and contributing

Please report bugs (or ask questions at)
<https://github.com/wsmith-sch/tamu-talk/issues>.

## Author

Wyatt Smith: <216wsmith@gmail.com>

## License

Released under the LaTeX Project Public License v1.3c or later. See
<https://www.latex-project.org/lppl.txt>.
