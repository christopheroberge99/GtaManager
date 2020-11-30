//
//  TimerPR.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-11-13.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//

import Foundation
import SwiftUI

class TimerPR: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    
    @Published var secondsLeft = 9000
    
    @Published var MoneySpent = 0
    
    @Published var secondesDonnees = 100
    
    @Published var updater : Bool = false
    
    var timer = Timer()
    
    func setSecondsLeft(secs : Int){
           secondesDonnees = secs
           updater = true
       }
    
    func addToSpent(){
        
        if secondsLeft < secondesDonnees/5 || secondsLeft == secondesDonnees {
        MoneySpent += 75
        }
        if secondesDonnees/5 < secondsLeft && secondsLeft < 2*secondesDonnees/5 {
        MoneySpent += 60
        }
        if 2*secondesDonnees/5 < secondsLeft && secondsLeft < 3*secondesDonnees/5 {
        MoneySpent += 45
        }
        if 3*secondesDonnees/5 < secondsLeft && secondsLeft < 4*secondesDonnees/5 {
        MoneySpent += 30
        }
        if 4*secondesDonnees/5 < secondsLeft && secondsLeft < secondesDonnees {
        MoneySpent += 15
        }
        
        
    }
    
    func decreaseSpent() {
        if MoneySpent < 30 {
            MoneySpent = 0
            
        }
        else{
        MoneySpent -= 30
        }
    }
    
    func start() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound])
        {(granted, error) in
        
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Supplies empty in 5 min!"
        content.body = "Pharmaceutical research"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (Double(secondsLeft))-300, repeats: false)
        
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        center.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        self.timerMode = .initial
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0{
                self.reset()
            }
            self.secondsLeft -= 1
        })
    }
    
    func reset() {
        self.timerMode = .initial
        if updater{
             self.secondsLeft = self.secondesDonnees
        }
        else{
            //self.secondsLeft = 9000
        }
        timer.invalidate()
    }
    
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
        
    }
    func resetSpent() {
          MoneySpent = 0
       }
   
}
