//
//  ContentView.swift
//  ShakeShake
//
//  Created by Julia Santos on 16/04/20.
//  Copyright © 2020 Julia Santos. All rights reserved.
//

import SwiftUI
import Combine
import CoreMotion

struct ContentView: View {
    
    @ObservedObject
    var motion: MotionManager
    
    var body: some View {
        VStack{
            Text("Accelerometer Data")
            Text("X: \(motion.x)")
            Text("Y: \(motion.y)")
            Text("Z: \(motion.z)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(motion: MotionManager())
        
    }
}

