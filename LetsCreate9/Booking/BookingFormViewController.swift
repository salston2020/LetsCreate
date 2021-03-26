//
//  BookingFormViewController.swift
//  LetsCreate9
//
//  Created by Sheena Alston on 3/25/21.
//

import UIKit

class BookingFormViewController: UIViewController {

    @IBOutlet weak var jobTypeText: UITextField!
    @IBOutlet weak var zipcodeText: UITextField!
    @IBOutlet weak var quoteText: UITextField!
    @IBOutlet weak var hoursText: UITextField!
    @IBOutlet weak var quotenegotiable: UISegmentedControl!
    @IBOutlet weak var jobdetails: UITextField!
    @IBOutlet weak var completebutton: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    
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
