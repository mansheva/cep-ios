//
//  designColors.swift
//  23234234
//
//  Created by Maria Novikova on 02.07.2022.
//

import Foundation
import SwiftUI

let ff = 255.0

struct DesignColors {
    
    //let TabGray = Color.init(red: 86/ff, green: 96/ff, blue: 105/ff)
    //let TabGrayLight = Color.init(red: 100/ff, green: 107/ff, blue: 115/ff)
    let TabGrayDark = Color.init(red: 71/ff, green: 85/ff, blue: 95/ff) // почему-то осветляется на TabView
    let TabGray = Color.init(red: 86/ff, green: 96/ff, blue: 105/ff)
    
    let TabBlue = Color.init(red: 131/ff, green: 225/ff, blue: 255/ff)
    
    let TextBase = Color.init(red: 50/ff, green: 50/ff, blue: 50/ff)
    let TextBlue = Color.init(red: 14/ff, green: 129/ff, blue: 165/ff)
    let TextDarkBlue = Color.init(red: 7/ff, green: 80/ff, blue: 103/ff)
    let TextLightBlue = Color.init(red: 10/ff, green: 183/ff, blue: 238/ff)
    let TextGreen = Color.init(red: 162/ff, green: 208/ff, blue: 86/ff)
    let TextGray = Color.init(red: 196/ff, green: 196/ff, blue: 196/ff)
    let TextPink = Color.init(red: 210/ff, green: 28/ff, blue: 128/ff)
    
    let BaseOrange = Color.init(red: 252/ff, green: 140/ff, blue: 41/ff)
    let BaseCoral = Color.init(red: 238/ff, green: 90/ff, blue: 71/ff)
    let BaseBlue = Color.init(red: 63/ff, green: 167/ff, blue: 214/ff)
    let BaseMagenta = Color.init(red: 210/ff, green: 28/ff, blue: 128/ff)
    let BaseMagentaDisabled = Color.init(red: 232/ff, green: 157/ff, blue: 198/ff)
    //let BasePurple = Color.init(red: 72/ff, green: 56/ff, blue: 209/ff)
    let BasePurple = Color.init(red: 132/ff, green: 118/ff, blue: 255/ff)
    let BaseLightPurple = Color.init(red: 187/ff, green: 177/ff, blue: 250/ff)
    let BaseDarkPurple = Color.init(red: 56/ff, green: 64/ff, blue: 117/ff)
    
    
    let YellowStar = Color.init(red: 255/ff, green: 199/ff, blue: 0/ff)
    
    // надо дополнить до X групп, и в каждой по Y цветов, и где-то проверять, что задано не больше
    let Gradients = [
        [
            Color.init(red: 0/ff, green: 128/ff, blue: 168/ff),
            Color.init(red: 7/ff, green: 152/ff, blue: 198/ff),
            Color.init(red: 64/ff, green: 183/ff, blue: 221/ff),
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff), //black
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff)  //black
        ],
        [
            Color.init(red: 167/ff, green: 8/ff, blue: 84/ff),
            Color.init(red: 207/ff, green: 6/ff, blue: 103/ff),
            Color.init(red: 244/ff, green: 90/ff, blue: 145/ff),
            Color.init(red: 255/ff, green: 129/ff, blue: 129/ff),
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff)  //black
        ],
        [
            Color.init(red: 0/ff, green: 166/ff, blue: 17/ff),
            Color.init(red: 153/ff, green: 208/ff, blue: 63/ff),
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff), //black
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff), //black
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff)  //black
        ],
        [
            Color.init(red: 203/ff, green: 207/ff, blue: 0/ff),
            Color.init(red: 86/ff, green: 96/ff, blue: 105/ff),
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff), //black
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff), //black
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff)  //black
        ],
        [
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff), //black
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff), //black
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff), //black
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff), //black
            Color.init(red: 0/ff, green: 0/ff, blue: 0/ff)  //black
        ]
    ]
    
    let lessonNewBack = Color.init(red: 242/ff, green: 242/ff, blue: 242/ff)
    let lessonNewBorder = Color.init(red: 229/ff, green: 229/ff, blue: 229/ff)
    let lessonNewAccent = Color.init(red: 191/ff, green: 191/ff, blue: 191/ff)
    
    let lessonProcessBack = Color.init(red: 255/ff, green: 238/ff, blue: 179/ff)
    let lessonProcessBorder = Color.init(red: 255/ff, green: 168/ff, blue: 0/ff)
    let lessonProcessAccent = Color.init(red: 255/ff, green: 199/ff, blue: 0/ff)
    
    let lessonDoneBack = Color.init(red: 214/ff, green: 242/ff, blue: 204/ff)
    let lessonDoneBorder = Color.init(red: 50/ff, green: 192/ff, blue: 0/ff)
    let lessonDoneAccent = Color.init(red: 155/ff, green: 217/ff, blue: 117/ff)
}

let designColors = DesignColors()
