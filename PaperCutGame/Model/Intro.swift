//
//  Intro.swift
//  PaperCutGame
//
//  Created by Beking on 1/12/24.
//

import SwiftUI

struct Intro: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
}

var intros : [Intro] = [
    Intro(image: "step1", title: "Step 1", description: "Fold a square piece of paper along the diagonal.",color: Color("Blue")),
    Intro(image: "step2", title: "Step 2", description: "Fold it again.",color: Color("Yellow")),
    Intro(image: "step3", title: "Step 3", description: "Fold it into thirds.",color: Color("Pink")),
    Intro(image: "step4", title: "Step 4", description: "Fold it at another corner.",color: Color("Green")),
    Intro(image: "step5", title: "Step 5", description: "Draw the desired pattern on the paper.",color: Color("Blue")),
    Intro(image: "step6", title: "Step 6", description: "Cut along the traced lines with scissors.",color: Color("Yellow")),
    Intro(image: "step7", title: "Step 7", description: "Unfold the paper, revealing a symmetrical design.",color: Color("Blue")),
    Intro(image: "startgame", title: "Unveiling Symmetry", description: "Let's unravel the mystery and make predictions about the symmetrical design that will unfold from our folded creations. Can you discover the correct pattern? Give it a try!",color: Color("Red"))
]






