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

class MotionManager: ObservableObject {
    private var motionManager: CMMotionManager
    
    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.accelerometerUpdateInterval = 1.0 / 60.0
        self.motionManager.startAccelerometerUpdates()
        
        var timer = Timer(fire: Date(), interval: (1.0/60.0), repeats: true, block: { (timer) in
            
            if let data = self.motionManager.accelerometerData{
                
                let x = data.acceleration.x
                let y = data.acceleration.y
                let z = data.acceleration.z
                
                print(x, y, z)
                
                if x > 1 || x < -1{
                    return VStack {
                        Image("chocalho")
                    }
                }else{
                    return VStack {
                        Image("chocalho2")
                    }
                }
                if y > 1 || y < -1{
                    return VStack {
                        Image("chocalho")
                    }
                }else{
                    return VStack {
                        Image("chocalho2")
                    }
                }
                if z > 1 || z < -1{
                    return VStack {
                        Image("chocalho")
                    }
                }else{
                    return VStack {
                        Image("chocalho2")
                    }
                }
            }
        })
        RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
    }
}
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

