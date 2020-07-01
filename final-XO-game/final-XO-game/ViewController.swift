//
//  ViewController.swift
//  ios-CW-file-XO
//
//  Created by Bdour Almesri on 28/06/2020.
//  Copyright © 2020 mohammed almesri. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var turnLable: UILabel!
       var turn = 0
          override func viewDidLoad() {
            playSound()
              super.viewDidLoad()}
    @IBAction func tap(_ sender: UIButton) {
   if turn % 2 == 0 {
       sender.setTitle("X", for : .normal)
       turnLable.text = "O Turn"
       sender.setTitleColor(.yellow, for: .normal)
   } else {
       sender.setTitle("O", for : .normal)
       turnLable.text = "X Turn"
       sender.setTitleColor(.blue , for: .normal)
   }
   print(turn)
   sender.isUserInteractionEnabled = false
   turn += 1
   
   if  checkWinner(p: "X") {
              okAlert(title: "Yayyyy, X wins 😍", message: "Congrats! now reset the game !")
          }
          if  checkWinner(p: "O") {
              okAlert(title: "Yayyyy, O wins 😍", message: "Congrats! now reset the game !")
          }
          
      }
      func checkWinner(p: String) -> Bool {
          
    
    let f1 = b1.titleLabel?.text
        let f2 = b2.titleLabel?.text
        let f3 = b3.titleLabel?.text
        let f4 = b4.titleLabel?.text
        let f5 = b5.titleLabel?.text
        let f6 = b6.titleLabel?.text
        let f7 = b7.titleLabel?.text
        let f8 = b8.titleLabel?.text
        let f9 = b9.titleLabel?.text
        
        
        let r1 = (f1, f2, f3) == (p, p ,p)
        let r2 = (f4, f5, f6) == (p, p ,p)
        let r3 = (f7, f8, f9) == (p, p ,p)
        let c1 = (f1, f4, f7) == (p, p ,p)
        let c2 = (f2, f5, f8) == (p, p ,p)
        let c3 = (f3, f6, f9) == (p, p ,p)
        let d1 = (f1, f5, f9) == (p, p ,p)
        let d2 = (f3, f5, f7) == (p, p ,p)
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            print("👏")
            return true
        }
        else {
            return false
        }
    }

    @IBAction func Reset(_ sender: Any) {
        b1.titleLabel?.text = ""
             b2.titleLabel?.text = ""
             b3.titleLabel?.text = ""
             b4.titleLabel?.text = ""
             b5.titleLabel?.text = ""
             b6.titleLabel?.text = ""
             b7.titleLabel?.text = ""
             b8.titleLabel?.text = ""
             b9.titleLabel?.text = ""
             
             
             b1.setTitle("", for : .normal)
             b2.setTitle("", for : .normal)
             b3.setTitle("", for : .normal)
             b4.setTitle("", for : .normal)
             b5.setTitle("", for : .normal)
             b6.setTitle("", for : .normal)
             b7.setTitle("", for : .normal)
             b8.setTitle("", for : .normal)
             b9.setTitle("", for : .normal)
             
             b1.isUserInteractionEnabled = true
             b2.isUserInteractionEnabled = true
             b3.isUserInteractionEnabled = true
             b4.isUserInteractionEnabled = true
             b5.isUserInteractionEnabled = true
             b6.isUserInteractionEnabled = true
             b7.isUserInteractionEnabled = true
             b8.isUserInteractionEnabled = true
             b9.isUserInteractionEnabled = true
             turn = 0
        
    }
    func okAlert(title: String, message: String)
        {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(okAction)
            present(alertController, animated: true)
        }
    var bombSoundEffect: AVAudioPlayer?
    func playSound() {
    let path = Bundle.main.path(forResource: "xo.mp3", ofType:nil)!
    let url = URL(fileURLWithPath: path)

    do {
        bombSoundEffect = try AVAudioPlayer(contentsOf: url)
        bombSoundEffect?.play()
    } catch {
        

    }

  }
}
    
    
    
    
    
    
    
    
    
    
    
    


    
    
    
    
    


