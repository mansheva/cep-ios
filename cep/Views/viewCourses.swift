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
    
    //init() {
    //    let self.maxIndex = lessons.count
    //}
    
    
    var body: some View {
        
        //NavigationView {
        NavigationStack {
            VStack {
                viewTopPanel()
                viewLessonsList()
            }
            
        }
            
            
        //}
        //.navigationBarTitleDisplayMode(.inline)
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
        .padding(.bottom, -8)
    }
}

struct viewCourseCaption: View {
    var body: some View {
        VStack {
            Image("caption_gate")
                .padding(.bottom, -10)
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

struct viewLessonsList: View {
    
    var body: some View {
        ScrollView {
            viewCourseCaption()
            /*
            ForEach(lessons) { lesson in
                NavigationLink(destination: viewTasks(lesson: lesson)) {
                    viewLessonItem(lesson: lesson)
                }
                .padding()
            }
            */
            
            
            /*
            ForEach(0..<lessons.count, id: \.self) { index in

                    HStack {
                        //Text("index:\(index)")
                        ForEach(0..<3, id: \.self) { i in
                            
                            if index+i < lessons.count {
                                //print(index+i)
                                //print(index)
                                
                                if lessons[index+i].row == lessons[index].row {
                                    NavigationLink(destination: viewTasks(lesson: lessons[index+i])) {
                                        viewLessonItem(lesson: lessons[index+i])
                                    }
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 3)
                                }
                                else {
                                    Text("") }
                            }
                            else {
                                Text("") }
                        }
                        
                    }

            }
            .frame(maxWidth: .infinity)
            .background(.white)
            */
            
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
                            //    Text("\(lesson.row) != \(row)") }
                    }
                }

            }
            .frame(maxWidth: .infinity)
                
                
        }
        //.background(designColors.TabGray)
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
