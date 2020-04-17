//
//  AccelerateModelView.swift
//  ShakeShake
//
//  Created by Julia Santos on 17/04/20.
//  Copyright © 2020 Julia Santos. All rights reserved.
//

import SwiftUI
import Combine
import CoreMotion


class MotionManager: ObservableObject {
    private var motion = CMMotionManager()
    
    var body1: some View{
        Image("chocalho")
    }
    
    var body2: some View{
        Image("chocalho2")
    }
    
    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    
    init() {
        startAccelerometers()
    }
    
    func startAccelerometers() {
        
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
            self.motion.startAccelerometerUpdates()
            
            // Configure a timer to fetch the data.
            let timer = Timer(fire: Date(), interval: (1.0/60.0),
                              repeats: true, block: { (timer) in
                                
                                // Get the accelerometer data.
                                if let data = self.motion.accelerometerData {
                                    
                                    let x = data.acceleration.x
                                    let y = data.acceleration.y
                                    let z = data.acceleration.z
                                    
                                    print(x, y, z)
                                    
                                    if x > 1 || x < -1{
                                        self.body1
                                        
                                    } else{
                                        self.body2
                                    }
                                    
                                    if y > 1 || y < -1{
                                        self.body1
                                        
                                    } else{
                                        self.body2
                                    }
                                    
                                    if z > 1 || z < -1{
                                        self.body1
                                        
                                    } else{
                                        self.body2
                                    }
                                }
            })
            RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
        }
    }
}
