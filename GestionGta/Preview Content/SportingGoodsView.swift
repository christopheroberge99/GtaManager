//
//  SportingGoodsView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-05-08.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//


import SwiftUI

struct SportingGoodsView: View {
     @ObservedObject var timerSporting = UniversalTimer()
     @State var ValueOne = false
     @State var ValueTwo = false
    
      var body: some View {
     
        VStack{
            
            Image("BunkerLocation")
                .edgesIgnoringSafeArea(.top)
                .offset(y: -190)
                
            Image("Bunker")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
                .offset(y: -320)
                .padding(.bottom, -320)
            
            Text("Sporting goods")
                .font(.title)
                .offset(y: -120)
                .padding(.bottom)
            
            
            ZStack{
                Image("BigButton")
                    .offset(y: -120)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                VStack{
                    Toggle(isOn: $ValueOne) {
                        Text("Equipement upgrade")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .offset(y: -130)
                    
                    .padding(.vertical)
                    
                    Toggle(isOn: $ValueTwo) {
                        Text("Staff upgrade")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .offset(y: -130)
                }
                
            }
            
        
            

            HStack{
                ZStack{
                    Image("SquareButton")
                        .offset(y: -80)
                        .shadow(radius: 2)
                    VStack{
                        Text("\(timerSporting.secondsLeft)")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .offset(y: -80)
                        Text("Remaining time")
                            .offset(y: -80)
                    }
                }
                
                ZStack{
                    Image("SquareButton")
                        .offset(y: -80)
                        .shadow(radius: 2)
                    VStack{
                        Text("\(timerSporting.MoneySpent) $")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .offset(y: -80)
                        HStack{
                                Text("Money spent")
                                    .offset(y: -80)
                                
                                Text("(-)")
                                    .offset(y: -80)
                                 .onTapGesture(perform: {
                                        self.timerSporting.decreaseSpent()
                                          })
                                     }
                    }
                }
                
            }
            
                  
            VStack{
                
                ZStack{
                    
                    Image("LongButton")
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .offset(y: -30)
                    Text("Resupply")
                        .offset(y: -30)
                        .font(.title)
                        .foregroundColor(.white)
                        .font(.headline)
                            .onTapGesture(perform: {
                                            
                                self.timerSporting.setName(nom: "Sporting Goods")
                                
                                            if self.ValueOne && !self.ValueTwo{
                                                self.timerSporting.setSecondsLeft(secs: 2400)
                                                       }
                                            else if self.ValueTwo && !self.ValueOne{
                                                self.timerSporting.setSecondsLeft(secs: 2400)
                                                       }
                                            else if self.ValueOne && self.ValueTwo{
                                                self.timerSporting.setSecondsLeft(secs: 3000)
                                                       }
                                            else if !self.ValueOne && !self.ValueTwo{
                                                self.timerSporting.setSecondsLeft(secs: 305)
                                                       }
                                            
                                            
                                            
                                    self.timerSporting.addToSpent()
                                    self.timerSporting.reset()
                                    self.timerSporting.timerMode == .running ? self.timerSporting.pause() :  self.timerSporting.start()
                                          
                                         })
                }
                
           
                HStack{
                    
                    ZStack{
                        Image("Button1")
                            .offset(y: -30)
                            .shadow(radius: 10)
                        
                        Text("Pause")
                            .offset(y: -30)
                            .foregroundColor(.white)
                            .font(.headline)
                                            .onTapGesture(perform: {
                                                self.timerSporting.timerMode == .running ? self.timerSporting.pause() :  self.timerSporting.start()
                                                   })
                    }
                    
                    ZStack{
                        Image("Button2")
                            .offset(y: -30)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        Text("Reset")
                            .offset(y: -30)
                            .foregroundColor(.white)
                            .font(.headline)
                            .font(.headline)
                                                     .onTapGesture(perform: {
                                                      self.timerSporting.reset()
                                                        self.timerSporting.resetSpent()
                                                     
                                                     })
                    }
                }
            }
            
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
          }
        }
      }


struct SportingGoodsView_Previews: PreviewProvider {
    static var previews: some View {
        SportingGoodsView()
    }
}
