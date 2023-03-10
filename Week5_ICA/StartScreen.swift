//
//  StartScreen.swift
//  Week5_ICA
//
//  Created by Alex Spoon on 2/17/23.
//

import SwiftUI

struct StartScreen: View {
    
    @Binding var playerName: String //5. Binding of State to User Interface Controls ---------------- 5
    
    let continueMessagePt1: String = "Go to" //1. Use of Constants in variable construction ---------------- 1
    let continueMessagePt2: String = " AR Experience"
    
    var loginTimes = ["2.17.23/15:32:23", "2.16.23/12:12:19", "2.16.23/9:54:49"] //2. Storage of Numbers ---------------- 2

    let size = CGSize(width: 400, height: 400)
    
    var body: some View {
        let frame = calculateFrame(size: size)

        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Text("Welcome \(playerName)") 
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                    NavigationLink(destination:ContentView()) {
                        
                        Text(continueMessagePt1 + continueMessagePt2) //3. Joining of Strings ---------------- 3
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Spacer()
                }
                .padding(40)
                .frame(width: frame.width, height: frame.height)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                Spacer()
                
                Text("Last Login Times")
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                    .font(.title3)
                
                
                ForEach(0..<loginTimes.count) { index in //6. Creation of Views in a loop ---------------- 6
                    Text(loginTimes[index])
                        .padding()
                        .foregroundColor(.white)
                }
            }
            
            
            .onAppear(perform: changeName) //9. Use of function as a parameter ---------------- 9
            }


        }
    
    func changeName() {
        switch playerName { //4. Use of Switch Statements ---------------- 4
            case "Alex":
                playerName = "Creator"
            case "Ellertson":
                playerName = "Big Kahuna"
            case "Alan":
                playerName = "Swift Overlord"
            default:
                playerName = playerName
        }
    }
    
    func calculateFrame(size: CGSize) -> CGRect {
        let aspectRatio: CGFloat = 0.75 // aspect ratio
        let height = min(size.width, size.height * aspectRatio)
        let width = height / aspectRatio
        let x = (size.width - width) / 2
        let y = (size.height - height) / 2

        return CGRect(x: x, y: y, width: width, height: height) //8. Return of Multiple Values from a function ---------------- 8
    }
    
    
    
}


