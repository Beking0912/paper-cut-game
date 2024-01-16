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
    Intro(image: "dragon", description: "Dragon paper cutting symbolizes auspiciousness, power, and good fortune.", ref: "by Mr. Shen Peinong"),
    Intro(image: "flower", description: "A paper cutting design adorned with the symbolic peony, believed to bring prosperity and good fortune.", ref: "by xiaohongshu user 9420028752"),
    Intro(image: "xi", description: "Delving into symbolic designs, we find creations like the 'Double 喜' paper cutting, symbolizing unity in marriage.", ref: "by xiaohongshu user 874478794"),
    Intro(image: "fu", description: "An intricate paper cutting design showcasing the auspicious character 福, symbolizing blessings and happiness.", ref: "by xiaohongshu user 974474756"),
    Intro(image: "fish", description: "A beautifully crafted fish paper cutting design, a symbol of abundance and prosperity.", ref: "by xiaohongshu user 553376519")
]

var intros2 : [Intro] = [
    Intro(image: "door", description: "Affixed to doors, windows, and decorative arrangements for visual enhancement, such as door couplets and window flowers.", ref: "by xiaohongshu user 339919391"),
    Intro(image: "shadow", description: "Integrates shadow puppetry with paper cutting, giving rise to a layered and nuanced art form known as shadow cutting.", ref: "by xiaohongshu user 2655433006"),
    Intro(image: "blue", description: "Functions as a block for blue-printed cloth, imprinting clothing, quilt covers, and other textiles with cultural significance.", ref: "by xiaohongshu user 104406622"),
    Intro(image: "gift", description: "Embellishes gifts, dowries, and tributes, bringing a sense of ceremony with designs like wedding flowers and Chongyang flags.", ref: "by xiaohongshu user 271393569"),
    Intro(image: "shoes", description: "Utilized as patterns for clothing, shoes, and hats, enhancing embroidered designs with intricate details.", ref: "by xiaohongshu user 603397174")
]
