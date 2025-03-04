//
//  ContentView.swift
//  23234234
//
//  Created by Maria Novikova on 05.06.2022.
//

import SwiftUI

var wantTaskItemGroup = 0
var wantTaskItemNum = 0

struct viewTasks: View {
    
    var lesson: Lesson
    @State private var showTaskItem = false
    
    var body: some View {
        ScrollView() {
            
            LessonCaption(imageName: lesson.imageNameFull, lessonCaption: lesson.nameFull, starsActiveCount: lesson.starsDone, starsFullCount: lesson.starsAll)
            
            ForEach(0..<lesson.taskGroups.count, id: \.self) { groupIndex in
                TaskGroupCaption(grpCaption: lesson.taskGroups[groupIndex].name)
                
                ForEach(0..<lesson.taskGroups[groupIndex].tasks.count, id: \.self) { taskIndex in
                    TaskItem(task: lesson.taskGroups[groupIndex].tasks[taskIndex], groupIndex: groupIndex, taskIndex: taskIndex)
                }
            }
        }
        .fullScreenCover(isPresented: $showTaskItem) {
            //viewTaskListenAudio(task: lesson.taskGroups[0].tasks[0])
            chooseDestination(task: lesson.taskGroups[wantTaskItemGroup].tasks[wantTaskItemNum])
        }
    }
    
    // MARK: общий заголовок
    func LessonCaption(imageName: String, lessonCaption: String, starsActiveCount: Int, starsFullCount: Int) -> some View {
        
        VStack() {
            ZStack(alignment: .bottom) {
                Image(imageName)
                    .padding(.top, 0)
                HStack() {
                    Spacer()
                    Text("\(starsActiveCount) / \(starsFullCount)")
                        .foregroundColor(designColors.TextGreen)
                        .font(.system(size: 22))
                        .frame(alignment: .trailing)
                        .padding(.trailing, basePadding)
                }
                
            }
            Text(lessonCaption)
                .font(.largeTitle)
                .foregroundColor(designColors.TextBlue)
                .fontWeight(.thin)
                .multilineTextAlignment(.center)
                .padding(.horizontal, basePadding)
                .frame(alignment: .center)
                .lineLimit(2)
                .frame(height: 70.0)
                .minimumScaleFactor(0.7)
        }
        
    }
    
    // MARK: подзаголовочек
    func TaskGroupCaption(grpCaption: String) -> some View {
        
        Text(grpCaption)
            .foregroundColor(designColors.TextGray)
            .padding(.vertical, basePadding)
            .font(.system(size: 16))
    }
    
    struct TaskParams {
        let caption: String
        let imageSystemName: String
    }
    
    func getTaskParams(taskType: String) -> TaskParams {
        switch taskType {
        case "read_excerpt":
            return TaskParams(caption: "Прочти отрывок", imageSystemName: "text.redaction")
        case "listen_audio":
            return TaskParams(caption: "Прослушай аудио", imageSystemName: "headphones")
        case "watch_video":
            return TaskParams(caption: "Посмотри видео", imageSystemName: "play.rectangle.fill")
        case "insert_missed":
            return TaskParams(caption: "Вставь пропущенное", imageSystemName: "gamecontroller.fill")
        case "find_words":
            return TaskParams(caption: "Найди слова", imageSystemName: "tablecells.fill")
        case "put_in_order":
            return TaskParams(caption: "Расставь по порядку", imageSystemName: "cloud.fill")
        case "write_by_heart":
            return TaskParams(caption: "Запиши наизусть", imageSystemName: "text.quote")
        case "discuss_with_god":
            return TaskParams(caption: "Обсуди с Богом", imageSystemName: "ellipsis.vertical.bubble.fill")
        case "comment":
            return TaskParams(caption: "Прокомментируй", imageSystemName: "text.bubble.fill")
        case "answer_question":
            return TaskParams(caption: "Ответь на вопрос", imageSystemName: "questionmark.diamond.fill")
        case "pass_test":
            return TaskParams(caption: "Пройди тест", imageSystemName: "checklist")
        default:
            return TaskParams(caption: "Unknown task type!", imageSystemName: "")
        }
    }
    
    @ViewBuilder func chooseDestination(task: Task) -> some View {
        switch task.type {
        case "read_excerpt": viewTaskReadExcerpt(task: task)
        case "listen_audio": viewTaskListenAudio(task: task)
        case "watch_video": viewTaskWatchVideo(task: task)
        default: viewTaskReadExcerpt(task: task)
        }
    }
    
    // MARK: заданьице
    @ViewBuilder func TaskItem(task: Task, groupIndex: Int, taskIndex: Int) -> some View {
        
        let taskParams = getTaskParams(taskType: task.type)
        
        //NavigationLink(destination: chooseDestination(task: task)) {
            HStack() {
                Button {
                    //wantTaskItem = task
                    
                    wantTaskItemGroup = groupIndex
                    wantTaskItemNum = taskIndex
                    showTaskItem = true
                } label: {
                    Image(systemName: taskParams.imageSystemName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(10)
                        .background(designColors.Gradients[groupIndex][taskIndex])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    Text(taskParams.caption)
                        .fontWeight(.light)
                    Spacer()
                    
                    Image(task.done ? "star_enabled" : "star_disabled")
                        .foregroundColor(.yellow)
                        .padding(.trailing, 15)
                }
            }
        //}
    }
}




struct viewTasks_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 13 Pro Max"], id: \.self) { deviceName in
            viewTasks(lesson: lessons[0])
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
