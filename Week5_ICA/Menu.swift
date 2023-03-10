//
//  Menu.swift
//  Week5_ICA
//
//  Created by Alex Spoon on 2/17/23.
//

import SwiftUI

struct Menu: View {
    
    @State var playerName: String = ""
    @State var shouldShowLink: Bool = false
    
    let namePrompt: String = "Please enter your name."
    
    var body: some View {

        NavigationStack {
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
                
                Text(writePrompt(with: namePrompt))
                    .padding(.bottom, 30)

                
                TextField("Name", text: $playerName) //7. Reading of Text from Textfield ---------------- 7
                    .onSubmit {
                        ShowContinue()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                    .frame(maxWidth: 500)
            }
            
            if shouldShowLink {
                NavigationStack {
                    NavigationLink(destination:StartScreen(playerName: $playerName)) {
                            Text("Continue")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
        }
    }
    
    func ShowContinue() {
        if playerName.count > 1 {
            shouldShowLink = true
        } else {
            shouldShowLink = false
        }
    }
    
    func writePrompt(with message: String) -> String { //10. Customized Parameter Labels ---------------- 10
        "\(message)"
    }
    
}

