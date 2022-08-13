//
//  ViewStudy.swift
//  23234234
//
//  Created by Maria Novikova on 05.06.2022.
//

import SwiftUI

@available(iOS 16.0, *)
struct viewCourses: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                viewTopPanel()
                viewLessonsList()
                viewBottomPanel()
            }
        }
    }
    
}

struct viewBottomPanel: View {
    var body: some View {
        HStack {
            //Spacer()
            VStack {
                Image("tab_learning").renderingMode(.template)
                Text("Обучение")
            }
            .foregroundColor(designColors.TabBlue)
            Spacer()
            //Spacer()
            VStack {
                Image("tab_church")
                Text("Церковь")
            }
            Spacer()
            //Spacer()
            VStack {
                Image("tab_target")
                Text("Цели")
            }
            Spacer()
            //Spacer()
            VStack {
                Image("tab_profile")
                Text("Профиль")
            }
            //Spacer()
        }
        .foregroundColor(.white)
        .font(.system(size: 12))
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .background(designColors.TabGray)
        //.padding(.bottom, -8)
    }
}
struct viewTopPanel: View {
    var body: some View {
        HStack {
            Image("top_icon_star")
            Text("315")
                .padding(.trailing)
            Image("top_icon_fire")
            Text("112")
            Spacer()
            Image("top_icon_mail")
            Text("+5 уведомлений")
        }
        .foregroundColor(.white)
        .font(.system(size: 12))
        .padding()
        .background(designColors.TabGray)
        //.padding(.bottom, -8)
    }
}



struct viewLessonsList: View {
    
    var body: some View {
        ScrollView {
            viewCourseCaption()
            
            ForEach(0..<maxRow(), id: \.self) { row in
                HStack {
                    ForEach(lessons) { lesson in
                        if lesson.row == row {
                            NavigationLink(destination: viewTasks(lesson: lesson)) {
                                viewLessonItem(lesson: lesson)
                            }
                            .padding(.vertical, 15)
                            .padding(.horizontal, 3)
                        }
                        //else {
                        //    Text("\(lesson.row) != \(row)")
                        //}
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    func maxRow() -> Int {
        var maxrow = 0
        for lesson in lessons {
            if (lesson.row > maxrow) {
                maxrow = lesson.row
            }
        }
        return maxrow+1
    }
    
}

struct viewCourseCaption: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("caption_gate")
                .padding(.bottom, -1)
                .padding(.top, 40)
            ZStack {
                Image("caption_ribbon")
                Text("Притчи Иисуса")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(.bottom, 5)
            }
            .padding(.bottom, 30)
        }
    }
}



@available(iOS 16.0, *)
struct ViewStudy_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 13 Pro Max"], id: \.self) { deviceName in
            viewCourses()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
