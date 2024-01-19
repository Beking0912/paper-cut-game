//
//  Step.swift
//  PaperCutGame
//
//  Created by Beking on 1/15/24.
//

import SwiftUI

struct Step: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
}

var steps : [Step] = [
    Step(image: "step1", title: "Step 1", description: "Fold a square piece of paper along the diagonal.",color: Color("Blue")),
    Step(image: "step2", title: "Step 2", description: "Fold it again.",color: Color("Yellow")),
    Step(image: "step3", title: "Step 3", description: "Fold it into thirds.",color: Color("Pink")),
    Step(image: "step4", title: "Step 4", description: "Fold it at another corner.",color: Color("Green")),
    Step(image: "step5", title: "Step 5", description: "Draw the desired pattern on the paper.",color: Color("Blue")),
    Step(image: "step6", title: "Step 6", description: "Cut along the traced lines with scissors.",color: Color("Yellow")),
    Step(image: "step7", title: "Step 7", description: "Unfold the paper, revealing a symmetrical design.",color: Color("Pink")),
    Step(image: "startgame", title: "Unveiling Symmetry", description: "Can you predict the symmetrical design unfolding from our folded creations?",color: Color("Green"))
]

