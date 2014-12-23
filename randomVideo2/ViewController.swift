//
//  ViewController.swift
//  randomVideo2
//
//  Created by Harry on 2014/12/4.
//  Copyright (c) 2014年 huangharry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    var result = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "seeResult" {
            if userInput.text.isEmpty {
                let alert = UIAlertView()
                alert.title = "Imput empty"
                alert.message = "請輸入一個N"
                alert.addButtonWithTitle("OK")
                alert.show()
                
                return false
            }
            else {
                if var N: Int = userInput.text.toInt()? {
                    result.removeAll(keepCapacity: false)
                    
                    for i in 1...N {
                        result.append(i)
                    }
                    for i in 0..<N {
                        let random = Int(arc4random_uniform(UInt32(N)))
                        
                        var temp = result[random]
                        result[random] = result[i]
                        result[i] = temp
                    }
                    println(result)
                    return true
                }
                else if var N: String = userInput.text {
                    let alert = UIAlertView()
                    alert.title = "Imput error"
                    alert.message = "請輸入一個N"
                    alert.addButtonWithTitle("OK")
                    alert.show()
                    
                    return false
                }
            }
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seeResult" {
            var resultPage = segue.destinationViewController as ResultViewController
            resultPage.result = self.result
        }
    }

}

