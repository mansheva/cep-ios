//
//  advDesignElements.swift
//  cep
//
//  Created by Maria Novikova on 14.08.2022.
//

import SwiftUI

@ViewBuilder func baseButtonLabel(text: String) -> some View {
    
    /*
    ZStack {
        Rectangle()
            .foregroundColor(designColors.BaseBlue)
            .cornerRadius(radius: 5, corners: .allCorners)
        
        Text(text)
            .padding(.vertical, 10)
            .font(.body)
            .foregroundColor(.white)
    }
    .frame(height: 40)
    .frame(maxWidth: 180)
    .padding()
    */
    Text(text)
        .font(.body)
        .foregroundColor(.white)
        .padding(.vertical, 10)
        .frame(maxWidth: 180)
        .background(designColors.BaseBlue)
        .cornerRadius(10)
}

@ViewBuilder func viewBack(action: @escaping () -> Void) -> some View {
    
    HStack{
        
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .font(.system(size: 24))
                //.foregroundColor(designColors.TextGray)
        }
        
        Spacer()
    }
    .padding(.top, 5)
    .padding(.bottom, 0)
    
}

@ViewBuilder func baseCaption(text: String) -> some View {
    Text(text)
        .font(.largeTitle)
        .fontWeight(.thin)
        .foregroundColor(designColors.TextBlue)
        // Без этого подзаголовок куда-то улетает вниз
        .padding(.bottom, 0.1)
}

@ViewBuilder func baseSubCaption(text: String, coral: Bool = false) -> some View {
    Text(text)
        //.font(.subheadline)
        .fontWeight(.light)
        .foregroundColor(coral ? designColors.BaseCoral : designColors.TextPink)
        .padding(.top, 3)
        .padding(.bottom, 12)
        .multilineTextAlignment(.center)
}


@ViewBuilder func viewExcerpt(task: Task, translationIndex: Int) -> some View {
    ForEach(task.data.components(separatedBy: ","), id: \.self) { excerpt in
        if excerpt != "" {
            viewExcerptStrings(excerpt: excerpt, translationIndex: translationIndex)
        }
    }
}

@ViewBuilder func viewExcerptStrings(excerpt: String, translationIndex: Int) -> some View {
    
    //print(excerpt)
    //if excerpt == "" {
    //        return Text("Это странно, но отрывка нет")
    //}
    let currentTranslate = cTranslationsCodes[translationIndex]
    let book = books[currentTranslate]
    //print(currentTranslate)
    
    if book == nil {
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
                        .frame(width: 20, alignment: .leading)
                        .padding(.top, 3)
                    //Text(book.chapters[chapter].verses[verse_index].text)
                    Text((book!.chapters.first(where: {element in element.id == chapter})?.verses.first(where: {element in element.id == verse_index})!.text)!)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                //.padding(.horizontal, 16)
                .padding(.top, 4)
                //.frame(maxWidth: .infinity)
                
            }
        }
    }
}
