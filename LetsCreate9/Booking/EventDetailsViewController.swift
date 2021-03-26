//
//  EventDetailsViewController.swift
//  LetsCreate9
//
//  Created by Sheena Alston on 3/25/21.
//

import UIKit

class EventDetailsViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    
    
    @IBOutlet weak var eventType: UILabel!
    
    @IBOutlet weak var eventHours: UILabel!
    @IBOutlet weak var eventQuote: UILabel!
    @IBOutlet weak var eventZip: UILabel!
    @IBOutlet weak var eventDetails: UILabel!
    @IBOutlet weak var apply: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
