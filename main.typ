#import "@preview/unequivocal-ams:0.1.2": ams-article

#let title = [Canadian Self-Publishing Ebook Pricing: A Non-Linear Optimization Approach];
#let orcid-id = [0009-0000-5926-4279];
#let mscn = ("90-10", "91-10")

#set math.equation(numbering: "(1)")
#show par: set par(spacing: 2em)

#let license = [
#title  #sym.copyright 2025 by Mustafif Khan is licensed under CC BY-SA 4.0. To view a copy of this license, visit \ #link("https://creativecommons.org/licenses/by-sa/4.0/")
]

#show: ams-article.with(
  title: title,
  authors: (
    (
      name: "Mustafif Khan",
      department: [],
      organization: [MoKa Reads],
      location: [],
      email: "mustafif.khan@mokareads.org",
      url: "mokareads.org", 
    ),
  ),
  abstract: include "abstract.typ",
  bibliography: bibliography("zotero.bib", full: false, style:"acm-sig-proceedings-long-author-list.csl"),
)


#outline(title: "Table of Contents")

#outline(target: figure.where(kind: table), title: "List of Tables")
#outline(target: figure.where(kind: image), title: "List of Figures")

#pagebreak()

#include "introduction.typ"

#pagebreak()
#include "objective_fn.typ"
#pagebreak()
#include "empirical.typ"
#pagebreak()
#include "conclusion.typ"
#pagebreak()
#include "appendix.typ"
#pagebreak()
#include "ack.typ"


#pagebreak()