#let todo(content) = {
  align(center)[
  #rect(fill: yellow, content, width: 100%)
]
}

#let definition(body, numbered: true) = figure(
  body,
  kind: "theorem",
  supplement: [Definition],
  numbering: if numbered { n => counter(heading).display() + [#n] }
)

#let make_scenario_table(p, caption) = {
  let data = toml(p);
figure(
table(
  rows: 7, columns: 2,
  $beta$, $#data.beta1$,
  $alpha$, $#data.alpha$,
  $omega$, $#data.omega$,
  $v_0$, $#data.v0$,
  $r$, $#data.r$,
  $M$, $#data.M$, 
  $(p^-, p^+)$, $(#data.p_min, #data.p_max)$
), caption: caption)
}

#let make_results_table(p, caption) = {
    let data = toml(p);
    let A = data.Price.at(0)
    let B = data.Price.at(1)
    let C = data.Price.at(2)
    let D = data.Price.at(3)
    let E = data.Price.at(4)
    let F = data.Price.at(5)

    let pA = data.Royalty_Per_Platform.at(0)
    let pB = data.Royalty_Per_Platform.at(1)
    let pC = data.Royalty_Per_Platform.at(2)
    let pD = data.Royalty_Per_Platform.at(3)
    let pE = data.Royalty_Per_Platform.at(4)
    let pF = data.Royalty_Per_Platform.at(5)
figure(
table(
  rows: 4, columns: 7,
  table.cell("Platforms", colspan: 7),
  [], "A", "B", "C", "D", "E", "F",
  "Price", $\$#A$, $\$#B$, $\$#C$, $\$#D$, $\$#E$, $\$#F$,
  "Profit", $\$#pA$, $\$#pB$, $\$#pC$, $\$#pD$, $\$#pE$, $\$#pF$,
  "Revenue", table.cell($\$ #data.Revenue$, colspan: 6)
), caption: caption
)
}

  // "Prices", $#data.Price$,
  // "Revenue", $#data.Revenue$,
  // "Royalty Earned/Platform",
  //   $#data.Royalty_Per_Platform$