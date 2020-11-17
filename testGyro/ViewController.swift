//
//  ViewController.swift
//  testGyro
//
//  Created by Indra Kurniawan on 12/11/20.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var gyrox: UILabel!
    @IBOutlet weak var gyroy: UILabel!
    @IBOutlet weak var gyroz: UILabel!
    
    @IBOutlet weak var accelx: UILabel!
    @IBOutlet weak var accely: UILabel!
    @IBOutlet weak var accelz: UILabel!
    
    @IBOutlet weak var flip: UILabel!
    
    var motion = CMMotionManager()
    var timer = Timer()
    var isFlippingPage = false
    var orientation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        myGyro()
        myAccel()
        print("installed")
    }
    /*
    func myGyro() {
        if motion.isGyroAvailable {
//            self.motion.gyroUpdateInterval = 1.0
            self.motion.gyroUpdateInterval = 1.0 / 60.0
            self.motion.startGyroUpdates()

            // Configure a timer to fetch the accelerometer data.
            self.timer = Timer(fire: Date(), interval: (1.0 / 60.0), repeats: true, block: { (timer) in
                 // Get the gyro data.
                if let data = self.motion.gyroData {
                    let x = String(format: "%.3f", data.rotationRate.x)
                    let y = String(format: "%.3f", data.rotationRate.y)
                    let z = String(format: "%.3f", data.rotationRate.z)

                    self.gyrox.text = x
                    self.gyroy.text = y
                    self.gyroz.text = z
                    
//                    print("gyro \(x),\(y),\(z)")
                    // Use the gyroscope data in your app.
                }
            })

            // Add the timer to the current run loop.
            RunLoop.current.add(self.timer, forMode: RunLoop.Mode.default)
        }
    }
    */
    func myAccel() {
//        motion.accelerometerUpdateInterval = 1.0
        motion.accelerometerUpdateInterval = 1.0 / 60.0
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data {
                
                let x = String(format: "%.3f", myData.acceleration.x)
                let y = String(format: "%.3f", myData.acceleration.y)
                let z = String(format: "%.3f", myData.acceleration.z)
                
                self.accelx.text = "x: \(x)"
                self.accely.text = "y: \(y)"
                self.accelz.text = "z: \(z)"
                
//                print("acc \(x),\(y),\(z)")
                
                if self.isFlippingPage == false {
                    if myData.acceleration.x > -0 && myData.acceleration.x < 0.5 {
                        if myData.acceleration.y < -0.54 {
                            print("next page")
                            self.flip.text = "next page"
                            self.isFlippingPage = true
                        } else if myData.acceleration.y > 0.54 {
                            print("previous page")
                            self.flip.text = "previous page"
                            self.isFlippingPage = true
                        }
                    } else if myData.acceleration.x > 0.5 {
                        if myData.acceleration.y < -0.3 {
                            print("next page 2")
                            self.flip.text = "next page 2"
                            self.isFlippingPage = true
                        } else if myData.acceleration.y > 0.3 {
                            print("previous page 2")
                            self.flip.text = "previous page 2"
                            self.isFlippingPage = true
                        }
                    } else if myData.acceleration.x < 0 && myData.acceleration.x > -0.5 {
                        if myData.acceleration.y < -0.54 {
                            print("previous page 3")
                            self.flip.text = "previous page 3"
                            self.isFlippingPage = true
                        } else if myData.acceleration.y > 0.54 {
                            print("next page 3")
                            self.flip.text = "next page 3"
                            self.isFlippingPage = true
                        }
                    } else if myData.acceleration.x < -0.5 {
                        if myData.acceleration.y < -0.3 {
                            print("previous page 4")
                            self.flip.text = "previous page 4"
                            self.isFlippingPage = true
                        } else if myData.acceleration.y > 0.3 {
                            print("next page 4")
                            self.flip.text = "next page 4"
                            self.isFlippingPage = true
                        }
                    }
                    
                // if isFlipping == true
                } else {
                    if myData.acceleration.x > -0 && myData.acceleration.x < 0.5 {
                        if myData.acceleration.y > -0.17 && myData.acceleration.y < 0.17 {
                            print("normal")
                            self.flip.text = "normal"
                            self.isFlippingPage = false
                        }
                    } else if myData.acceleration.x > 0.5 {
                        if myData.acceleration.y > -0.1 && myData.acceleration.y < 0.1 {
                            print("normal 2")
                            self.flip.text = "normal 2"
                            self.isFlippingPage = false
                        }
                    } else if myData.acceleration.x < 0 && myData.acceleration.x > -0.5 {
                        if myData.acceleration.y > -0.17 && myData.acceleration.y < 0.17 {
                            print("normal 3")
                            self.flip.text = "normal 3"
                            self.isFlippingPage = false
                        }
                    } else if myData.acceleration.x < 0.5 {
                        if myData.acceleration.y > -0.1 && myData.acceleration.y < 0.1 {
                            print("normal 4")
                            self.flip.text = "normal 4"
                            self.isFlippingPage = false
                        }
                    }
                    //wait animation complete
                }
            }
        }
    }
}
