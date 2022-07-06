//
//  viewTaskReadExcerpt.swift
//  23234234
//
//  Created by Maria Novikova on 06.07.2022.
//

import SwiftUI

struct viewTaskReadExcerpt: View {
    
    var task: Task
    
    var body: some View {
        
        VStack {
            Text("Прочти отрывок")
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundColor(designColors.TextBlue)
            Text(task.data)
                .font(.title2)
                .fontWeight(.thin)
                .foregroundColor(designColors.TextPink)
            HStack {
                Button("SYNO", action: doNothing)
                    .frame(width: 100)
                //    .buttonBorderShape(.roundedRectangle)
                //    .border(.roundedRectangle)
                Button("НРП", action: doNothing)
                Button("EASY", action: doNothing)
                Button("РБЦ", action: doNothing)
            }
            ForEach(task.data.components(separatedBy: ","), id: \.self) { excerpt in
                if excerpt != "" {
                    getExcerptStrings(excerpt: excerpt)
                }
            }
        }
        
        
        
    }
}

func doNothing() {
    
}

func getExcerptStrings(excerpt: String) -> some View {
    
    //if excerpt == "" {
    //        return Text("Это странно, но отрывка нет")
    //}
    
    var tempTemp = excerpt.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
    //let book_name = tempTemp[0]
    let verses_address = tempTemp[1]
    
    tempTemp = verses_address.components(separatedBy: ":")
    let chapter = Int(tempTemp[0])!
    let verses_interval = tempTemp[1]
    
    tempTemp = verses_interval.components(separatedBy: "-")
    let verse_first = Int(tempTemp[0])!
    let verse_last = tempTemp.count > 1 ? Int(tempTemp[1])! : Int(tempTemp[0])!
    
    return VStack {
        ForEach(verse_first...verse_last, id: \.self) { verse_index in
            HStack {
                Text(String(verse_index))
                    .font(.subheadline)
                    .foregroundColor(designColors.TextGray)
                    .frame(width: 20)
                Text(book.chapters[chapter].verses[verse_index].text)
            }
            .padding(10)
        }
    }
    
}

struct viewTaskReadExcerpt_Previews: PreviewProvider {
    static var previews: some View {
        viewTaskReadExcerpt(task: lessons[0].taskGroups[0].tasks[0])
    }
}
