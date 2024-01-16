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
    var description: String
    var ref: String
}

var intros : [Intro] = [
    Intro(image: "xi", description: "Delving into symbolic designs, we find creations like the 'Double 喜' paper cutting, symbolizing unity in marriage.", ref: ""),
    Intro(image: "flower", description: "A paper cutting design adorned with the symbolic peony, believed to bring prosperity and good fortune.", ref: ""),
    Intro(image: "fu", description: "An intricate paper cutting design showcasing the auspicious character 福, symbolizing blessings and happiness.", ref: ""),
    Intro(image: "dragon", description: "Dragon paper cutting symbolizes auspiciousness, power, and good fortune, often depicted in traditional folk art to celebrate important occasions and bring blessings.", ref: "by Mr. Shen Peinong"),
    Intro(image: "fish", description: "A beautifully crafted fish paper cutting design, a symbol of abundance and prosperity.", ref: "")
]






