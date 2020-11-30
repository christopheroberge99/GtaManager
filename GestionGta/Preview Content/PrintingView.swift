//
//  PrintingView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-05-08.
//  Copyright © 2020 Christophe Roberge. All rights reserved.




//

import SwiftUI

struct PrintingView: View {
     @ObservedObject var timerPrinting = UniversalTimer()
     @State var ValueOne = false
     @State var ValueTwo = false
    
      var body: some View {
     
        VStack{
            
            Image("PrintingLocation")
                .edgesIgnoringSafeArea(.top)
                .offset(y: -190)
                
            Image("Printing")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
                .offset(y: -320)
                .padding(.bottom, -320)
            
            Text("Printing & Copying")
                .font(.title)
                .offset(y: -120)
                .padding(.bottom)
            
            Toggle(isOn: $ValueOne) {
                Text("Equipement upgrade")
            }
            .padding(.horizontal)
            .offset(y: -120)
            
            
            Toggle(isOn: $ValueTwo) {
                Text("Staff upgrade")
            }
            .padding(.horizontal)
            .offset(y: -120)
        
          Spacer()
        
            Text("Remaining time: ")
                .offset(y: -110)
            Text("\(timerPrinting.secondsLeft)")
                .font(.largeTitle)
                .fontWeight(.medium)
                .offset(y: -110)
            

            VStack(spacing: 30) {
                
            HStack{
                
                    Text("Money spent on supplies: \(timerPrinting.MoneySpent) K $")
                    
                
                
                    Text("(-)")
                     .onTapGesture(perform: {
                            self.timerPrinting.decreaseSpent()
                              })
                         }
            .offset(y: -70)
                  
            Text("Resupply")
                .font(.title)
                .offset(y: -70)
                    .onTapGesture(perform: {
                                    
                        self.timerPrinting.setName(nom: "Printing & Copying")
                                    if self.ValueOne && !self.ValueTwo{
                                        self.timerPrinting.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueTwo && !self.ValueOne{
                                        self.timerPrinting.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueOne && self.ValueTwo{
                                        self.timerPrinting.setSecondsLeft(secs: 3000)
                                               }
                                    else if !self.ValueOne && !self.ValueTwo{
                                        self.timerPrinting.setSecondsLeft(secs: 1800)
                                               }
                                    
                                    
                                    
                            self.timerPrinting.addToSpent()
                            self.timerPrinting.reset()
                            self.timerPrinting.timerMode == .running ? self.timerPrinting.pause() :  self.timerPrinting.start()
                                  
                                 })
            
            
            Text("Pause")
                .offset(y: -70)
                                .onTapGesture(perform: {
                                    self.timerPrinting.timerMode == .running ? self.timerPrinting.pause() :  self.timerPrinting.start()
                                       })
                
            
            
            Text("Reset")
                .offset(y: -70)
                .font(.headline)
                                         .onTapGesture(perform: {
                                          self.timerPrinting.reset()
                                            self.timerPrinting.resetSpent()
                                         
                                         })
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
          }
        }
      }
    }


struct PrintingView_Previews: PreviewProvider {
    static var previews: some View {
        PrintingView()
    }
}
