//
//  ContentView.swift
//  RPS
//
//  Created by Gregory Daguerre on 01.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert: Bool = false
    @State private var randomIntWinOrLoose = Int.random(in: 0...1)
    @State var randomAppChoice = ["✊🏼", "✋🏼", "✌🏼"].shuffled()
    @State private var scoreTitle: String = "Correct"
    
    @State private var score: Int = 0
    var possibilites = ["✊🏼", "✋🏼", "✌🏼"]
        
    func gameCore(userInput: String,
                  appFinaleChoice: String) {
        
        showAlert = true
        if appFinaleChoice == "RockLoose" && userInput == "✌🏼" {
            scoreTitle = "Correct"
            score += 1
        } else if appFinaleChoice == "RockWin" && userInput == "✋🏼" {
            scoreTitle = "Correct"
            score += 1
        } else if appFinaleChoice == "PaperLoose" && userInput == "✊🏼" {
            scoreTitle = "Correct"
            score += 1
        } else if appFinaleChoice == "PaperWin" && userInput == "✌🏼" {
            scoreTitle = "Correct"
            score += 1
        } else if appFinaleChoice == "ScissorsLoose" && userInput == "✋🏼" {
            scoreTitle = "Correct"
            score += 1
        } else if appFinaleChoice == "ScissorsWin" && userInput == "✊🏼" {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }
    }
  
    func appChoice(inputPossibility: String) -> String {
        
        let appChoice = inputPossibility
        
        if appChoice == "✊🏼" && randomIntWinOrLoose == 0 {
            return "RockLoose"
        } else if appChoice == "✊🏼" && randomIntWinOrLoose == 1 {
            return "RockWin"
        } else if appChoice == "✋🏼" && randomIntWinOrLoose == 0 {
            return "PaperLoose"
        } else if appChoice == "✋🏼" && randomIntWinOrLoose == 1 {
            return "PaperWin"
        } else if appChoice == "✌🏼" && randomIntWinOrLoose == 0 {
            return "ScissorsLoose"
        } else if appChoice == "✌🏼" && randomIntWinOrLoose == 1 {
            return "ScissorsWin"
        } else {
            return "Something went wrong"
        }
    }
    
    func showPossibilites(input: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.white.opacity(0.3))
                .frame(width: 100, height: 100)
            Text(possibilites[input])
                .padding(10)
                .font(.system(size: 90))
        }
    }
    
    func askQuestion () {
        randomAppChoice.shuffle()
        randomIntWinOrLoose = Int.random(in: 0...1)
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.green, .cyan, .cyan, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
         
                VStack(spacing: 20) {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white.opacity(0.3))
                            .frame(width: 350, height: 50)
                        HStack {
                            Text("The app choose")
                            Text(randomAppChoice[0])
                            Text("and want you to")
                            randomIntWinOrLoose == 0 ?
                            Text("loose").foregroundStyle(Color.white) : Text("win").foregroundStyle(Color.white)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        ForEach(0..<3) { index in
                            Button {
                                gameCore(userInput: possibilites[index], appFinaleChoice: appChoice(inputPossibility: randomAppChoice[0]))
                            } label: {
                                showPossibilites(input: index)
                            }
                        }
                    }
                    Spacer()
                    
                    Text("Your score \(score)")
                        .font(.title.bold())
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
            }
            .navigationTitle("Rock Paper Scissors")
            .navigationBarTitleDisplayMode(.inline)
            .alert(scoreTitle ,isPresented: $showAlert) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
        }
    }
}

#Preview {
    ContentView()
}
