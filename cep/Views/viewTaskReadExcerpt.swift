//
//  viewTaskReadExcerpt.swift
//  23234234
//
//  Created by Maria Novikova on 06.07.2022.
//

import SwiftUI

var globalCurrentTranslationIndex: Int = 0
let cTranslationsNames = ["SYNO", "НРП", "EASY", "РБЦ"]
let cTranslationsCodes = ["SYNO", "NRT", "EASY", "RBC"]

struct viewTaskReadExcerpt: View {
    
    var task: Task
    @State var currentTranslationIndex: Int = globalCurrentTranslationIndex
    
    let cRadius = 6.0
    //let cTranslations: [String:String] = ["SYNO":"SYNO", "NRT":"НРП", "2":"EASY", "3":"РБЦ"]
    
    
    var body: some View {
        
        VStack {
            Text("Прочти отрывок")
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundColor(designColors.TextBlue)
                .padding(.bottom, -7)
            Text(task.dataDescription)
                .font(.subheadline)
                .fontWeight(.thin)
                .foregroundColor(designColors.TextPink)
                .padding(.bottom, 12)
            
            viewTranslateButtons()
            
            ScrollView() {
                ForEach(task.data.components(separatedBy: ","), id: \.self) { excerpt in
                    if excerpt != "" {
                        viewExcerptStrings(excerpt: excerpt)
                    }
                }
            }
            .padding(.top, 12)
        }
    }
    
    private func setTranslate(index: Int) {
        currentTranslationIndex = index
        globalCurrentTranslationIndex = index
    }
    
    private func viewTranslateButtons() -> some View {
        
        HStack(spacing: 1) {
            ForEach(Array(cTranslationsNames.enumerated()), id: \.element) { index, translation in
                Button(translation)
                {
                    self.setTranslate(index: index)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .font(.footnote)
                
                .foregroundColor(index != currentTranslationIndex ? designColors.BaseOrange : .white )
                .background(index == currentTranslationIndex ? designColors.BaseOrange : .white)
                
                .cornerRadius(radius: index==0 ? cRadius : 0, corners: [.topLeft, .bottomLeft])
                .cornerRadius(radius: index==cTranslationsNames.count-1 ? cRadius : 0, corners: [.topRight, .bottomRight])
            }
        }
        .foregroundColor(designColors.BaseOrange)
        .overlay(
            RoundedRectangle(cornerRadius: cRadius)
                .stroke(designColors.BaseOrange, lineWidth: 2)
        )
        .font(.callout)
        .background(designColors.BaseOrange)
        .cornerRadius(cRadius)
        
    }
    
    @ViewBuilder
    func viewExcerptStrings(excerpt: String) -> some View {
        
        //print(excerpt)
        //if excerpt == "" {
        //        return Text("Это странно, но отрывка нет")
        //}
        let currentTranslate = cTranslationsCodes[currentTranslationIndex]
        let book22 = books[currentTranslate]
        //print(currentTranslate)
        
        if book22 == nil {
            Text("Этого перевода пока не существует!")
        }
        else {
            
            let arrExcerpt = excerpt.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
            //let book_name = arrExcerpt[0]
            let verses_address = arrExcerpt[1]
            
            let arrVersesAddress = verses_address.components(separatedBy: ":")
            let chapter = Int(arrVersesAddress[0])!
            let verses_interval = arrVersesAddress[1]
            
            let arrVersesInterval = verses_interval.components(separatedBy: "-")
            let verse_first = Int(arrVersesInterval[0])!
            let verse_last = arrVersesInterval.count > 1 ? Int(arrVersesInterval[1])! : Int(arrVersesInterval[0])!
            
            VStack {
                ForEach(verse_first...verse_last, id: \.self) { verse_index in
                    HStack(alignment: .top, spacing: 4) {
                        Text(String(verse_index))
                            .font(.footnote)
                            .foregroundColor(designColors.TextGray)
                            .frame(width: 20, alignment: .top)
                            .padding(.top, 3)
                        //Text(book.chapters[chapter].verses[verse_index].text)
                        Text((book22!.chapters.first(where: {element in element.id == chapter})?.verses.first(where: {element in element.id == verse_index})!.text)!)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 4)
                    //.frame(maxWidth: .infinity)
                    
                }
            }
        }
    }
}

struct viewTaskReadExcerpt_Previews: PreviewProvider {
    static var previews: some View {
        viewTaskReadExcerpt(task: lessons[0].taskGroups[0].tasks[0])
    }
}
