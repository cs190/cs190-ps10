//
//  ViewController.swift
//  Plist Opener
//
//  Created by Brian Hill on 5/2/16.
//

import UIKit

class TitleViewController: UIViewController {
    
    var plistTitle: String! = nil
    
    @IBOutlet weak var titleTextField: UITextField! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        titleTextField.text = plistTitle
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
