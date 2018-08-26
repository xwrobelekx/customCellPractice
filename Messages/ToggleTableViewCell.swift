//
//  ToggleTableViewCell.swift
//  Messages
//
//  Created by Kamil Wrobel on 8/25/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit
//#3 declare Delegate protocol
protocol  ToggleTableViewCellDelegate {
    //#4 declare protocol method
    func didToggle(isOn: Bool)
}

//#1 declare new class of type UITableViewCell
class ToggleTableViewCell: UITableViewCell {

    //#5 declare optional delegate conforming to the protocol
    var delegate: ToggleTableViewCellDelegate?
    //#2 add action for the toggle
    @IBAction func didToggle(_ sender: UISwitch) {
        //#6 call the did Toggle function using the delegate, and passing the sender form the action
      self.delegate?.didToggle(isOn: sender.isOn)
    }
    
    
    
    
}
