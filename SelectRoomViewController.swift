//
//  SelectRoomViewController.swift
//  HomeAutoBot
//
//  Created by Jakkrits on 1/25/2559 BE.
//  Copyright © 2559 AppIllus. All rights reserved.
//

import UIKit
import HomeKit

class SelectRoomViewController: UIViewController, HMHomeManagerDelegate {
    
    let homeManager = HMHomeManager()
    @IBOutlet weak var livingRoomButton: UIButton!
    @IBOutlet weak var garageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeManager.delegate = self
    }
    
    @IBAction func unwindMainMenu(segue: UIStoryboardSegue) {
        
    }
    
    //MARK: - HMHomeManagerDelegate Methods
    func homeManagerDidUpdateHomes(manager: HMHomeManager) {
        if manager.homes.count == 0 {
            //No home setup
            //Setup home
            manager.addHomeWithName("Our Home", completionHandler: { (home, error) -> Void in
                if error != nil {
                    self.displayError(error!)
                    return
                }
                home?.addRoomWithName("Living Room", completionHandler: {room, error in
                    if error != nil {
                        self.displayError(error!)
                    }
                    }
                )
            })
        }
    }
    
}

extension UIViewController {
    func displayError(error: NSError) {
        print(error.localizedDescription)
    }
}
