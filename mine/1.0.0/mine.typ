#import "@preview/theorion:0.4.0": *

// Formatting, etc.
#let prelude(rest) = {
    show: show-theorion
    show sym.colon: $class("fence", colon)$
    show sym.tilde: $class("fence", ~)$
    show math.equation.where(block: false): set math.frac(style: "horizontal")
    rest
}

#let pset(
    class_name: [*No `class_name` Given*],
    name: [Aspen Price],
    due: [*No `due` given*],
    font-size: 12pt,
    enum-numbering: "1.a.i)"
    rest
) = {
    show: prelude

    set document(
        title: [#class_name Problem Set],
        author: name,
        description: [Problem Set],
        date: due
    )

    set page(
        paper: "a4"
        header: [
            #smallcaps([#class_name])
            #h(1fr)
            #due.display("[month repr:long] [day]")
            #h(1fr)
            #name
        ],
        number: "1",
        number-align: right
    )

    set align(left)
    set text(size: font-size)
    set enum(numbering: enum-numbering, full: true)
    set heading(numbering: "1.1.a")
    set math.equation(numbering: "(1)", supplement: [Eq.])

    rest
}

#let notes(
    class_name: [*No `class_name` Given*],
    name: [Aspen Price],
    font-size: 12pt,
    enum-numbering: "1.a.i)"
    rest
) = {
    show: prelude

    set document(
        title: [#class_name Notes],
        author: name,
        description: [Notes],
    )

    set page(
        paper: "a4"
        number: "1",
        number-align: right
    )

    set align(center)
    set text(20pt)
    [
        #class_name Notes\
        #set text(14pt)
        #name
    ]

    set align(left)
    set text(size: font-size)
    set enum(numbering: enum-numbering, full: true)
    set heading(numbering: "1.1.a")
    set math.equation(numbering: "(1)", supplement: [Eq.])

    rest
}

#let prb(book-number, enum-numbering: "a.i)", body) = context {
    set enum(numbering: enum-numbering, full: false)
    let marker = [*(#book-number)*]
    box(grid(
        columns: (35pt, auto),
        gutter: 3pt,
        marker,
        body
    ))
}

// Aliasing & Math
#let OP = math.op

// LA
#let span = OP("Span")
#let Tr = OP("Tr")
#let trace = OP("trace")
#let transpose(arg, ...rest) = {
    if rest.named().at("parens", default: false) {
        $(#arg)^T$
    } else {
        $#arg^T$
    }
}

// Groups
#let hom = OP("Hom")
#let mor = OP("Mor")
#let aut = OP("Aut")
#let GL = OP("GL")
#let SL = OP("SL")
#let PGL = OP("PGL")

// Graph Theory
#let diam = OP("diam")

// Calculus
#let int = math.integral
#let iint = int.double
#let iiint = int.triple
#let iiiint = int.quad
#let oint = int.cont
#let oiint = int.surf
#let oiiint = int.vol

// Symbols, generally
#let implies = math.arrow.r.double
#let impliedby = math.arrow.l.double
#let iso = math.tilde.equiv
#let sim = math.tilde.eq
#let cong = math.eq.triple
#let sl = math.slash
#let Sum = math.limits(math.sum)
#let prod = math.product
#let Prod = math.limits(prod)
#let inv(arg) = $#arg^(-1)$
#let Frac = math.frac.with(style: "vertical")

// Greek
#let eps = math.epsilon
#let del = math.partial
#let lm = math.lambda

// Sets & Topology
#let Int = OP("Int")
#let Ext = OP("Ext")
#let Cl = OP("Cl")
#let cl = math.overline
#let Bd = OP("Bd")
#let cup = math.union
#let cap = math.inter
