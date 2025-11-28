#let report(
  title: none,
  author: none,
  group_name: none,
  course_name: none,
  unit_type: none,
  report_type: none,
  supervisor: none,
  date: none,
  location: "Egham",
  references: "references.yml", // Note: This file needs to exist.
  body 
) = {
  // === DOCUMENT SETUP ===
  set document(title: [#title], author: author)
  set text(font:"Nimbus Sans")
  set list(indent: 0.6cm)
  set par(justify: true)
  show link: underline

  // === HEADING STYLES ===
  show heading: set block(above: 30pt, below: 16pt)

  // Chapter-level headings
  show heading.where(level: 1): set text(size: 20pt)

  // Section-level headings
  show heading.where(level: 2): set text(size: 16pt)
  
  // === PAGE SETUP ===
  // Add a header to all pages except the first one.
  set page(header: context {if counter(page).get().first() > 1 [#report_type #h(1fr) #author]})


  // === FRONT PAGE ===
  set align(center)

  v(3mm)
  line(length: 100%)
  text(30pt, weight: "bold", title)
  v(1mm)
  text(18pt, author)
  v(3mm)
  line(length: 100%)
 
  v(1fr) // Pushes the following content to the bottom of the page.

  text(12pt)[#date]

  pagebreak()

  // === MAIN BODY ===
  // Reset page numbering for the main content.
  set page(numbering: "1", number-align: center)
  counter(page).update(1)

  // The main content of the document is passed in here.
  set align(left)
  body

  // === BIBLIOGRAPHY ===
  // The bibliography has been commented out to prevent rendering errors.
  // To use it, create a "references.yml" file and uncomment the line below.
  // bibliography(references, title: "Bibliography")
}

#show: report.with(
  title: "IY3660 Summative Assignment",
  author: "Luka van Rooyen",
  course_name: "BSc Computer Science (Information Security)",
  supervisor: "Dr. Rachel Player",
  date: "October 2025",
  references: "references.yml" // Specify bibliography file here
)

= Question 1

*a)*

*b)*

Pre-image resistance is the property of a hash function $H$ such that it is computationally infeasible to find (given $y$), a string $m in {0,1}^*$ to produce $H(m) = y$. 

Suppose we have a hash function $H: {0,1}^* arrow {0,1}^n$ that is pre-image resistant. If we constuct another hash function $H prime$ such that: $H prime : {0,1}^* arrow {0,1}^n$ (the same as $H$). If we modify $H prime$ so that: 
#list(
[if the first (or only) bit in $m$ is $1$, ignore it and process the rest of the string], 
[if not, process the string normally]
)

$H prime$ is still pre-image resistant, as it inherits the property from $H$, and inputting any $m$ into both functions will be computationally infeasible to reverse and gain $y$. However, for $H prime$, if we have $m_1 = 1$ and $m_2 = 11$:

#list(
  [$H(m_1)$ and $H(m_2)$ will produce different results (as the function treats them as two different funcitons)],
  [However, $H prime(m_1)$ and $H prime(m_2)$ produce the same result as $H prime$ treats $m_2$ as the same string, removing the leading $1$]
)

This means that while $H prime$ is pre-image resistant, it is not second pre-image resistant as we have $m_1 != m_2$ such that $H prime(m_1) = H prime(m_2)$

= Question 2

