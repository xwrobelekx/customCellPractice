 //
//  ViewController.swift
//  Messages
//
//  Created by Kamil Wrobel on 8/25/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit
 
 struct Message {
    var sender: Sender
    var message: String
    var dateString: String
 }
 
 struct Sender {
    var name: String
    var avatar: UIImage?
    
 }
 
 var contacts = [
    Sender(name: "Kamil", avatar: UIImage(named: "Kamil")),
    Sender(name: "Jony", avatar: UIImage(named: "Jony")),
    Sender(name: "Steve", avatar: UIImage(named: "Steve"))
 ]
 
 
 var dummyMessages = [
    Message(sender: contacts[0], message: "Hi Jack. What are you doing?", dateString: "12-12-17"),
    Message(sender: contacts[1], message: "Hi Mary. I'm filling out a job application.", dateString: "12-12-17"),
    Message(sender: contacts[2], message: "Are you finished with school already?", dateString: "12-12-17"),
    Message(sender: contacts[0], message: "No. I have one more semester, but it would be great to have a job lined up.", dateString: "12-12-17"),
    Message(sender: contacts[1], message: "How is your day going?", dateString: "12-12-17"),
    Message(sender: contacts[2], message: "Quite busy. I'm preparing for my presentation tomorrow on our marketing strategy. I'm not even half done yet.", dateString: "12-12-17"),
    Message(sender: contacts[0], message: "You must feel stressed out now.", dateString: "12-12-17"),
    Message(sender: contacts[1], message: "That's an understatement.", dateString: "12-12-17"),
    Message(sender: contacts[2], message: "What are you doing now?", dateString: "12-12-17"),
    Message(sender: contacts[0], message: "I'm playing pool with my friends at a pool hall.", dateString: "12-12-17"),
    Message(sender: contacts[1], message: "I didn't know you play pool. Are you having fun?", dateString: "12-12-17"),
    Message(sender: contacts[2], message: "I'm having a great time. How about you? What are you doing?", dateString: "12-12-17"),
    
 
 
 
 ]
 
 
 
 
 
 
 //#13 conform to protocol of the Toggle cell delegate
 class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ToggleTableViewCellDelegate {
    //#8 create an enum to toggle between the cells
    enum Section: Int {
        case doNotDisturb
        case messages
    }
    

    @IBOutlet weak var myTableView: UITableView!
    
    var messages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        messages = dummyMessages
    }
    //#7 return 2 sections, bc were gone have 2 diferent cells
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //#15 number of rows depends on sections so we need a switch ststement to switch between sections
        //sections start at index 0, and ourcases have int raw values of 0, 1
        switch Section(rawValue: section)! {
        case .doNotDisturb: return 1
            
        case .messages: return messages.count
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //#9 using our enum we ned to use the raw value to switch on sections that can be accesed thru indexPath. section
        switch Section(rawValue: indexPath.section)!{
            //to get rid of the force unwraping, you would need to put a case of none at the end of the switch statement
            //the raw value is optional
        case .doNotDisturb:
            //#11 create the second cell
            let cell = myTableView.dequeueReusableCell(withIdentifier: "TogleCell", for: indexPath)
            if let cell = cell as? ToggleTableViewCell {
                //#12 set the delegate - the class need to confrom to ToggleTableViewDelegate protocol ^^
                cell.delegate = self
            }
            return cell
            
     
        //#10 the first cell logic goes under message, bc thats what this cell do
        case .messages:
        let cell = myTableView.dequeueReusableCell(withIdentifier: "messageTVCell", for: indexPath)
        // get the message for specified row
        let message = messages[indexPath.row]
        
        // now we want to cast our cell as the custom cell
        if let cell = cell as? MessageTVCell {
            cell.nameLabel.text = message.sender.name
            cell.avatarView.image = message.sender.avatar
            cell.dataLabel.text = message.dateString
            cell.messageLabel.text = message.message
        }
        return cell
        }
        
    }
    
    //#14 by conforming to the protocole, you need to write the required function
    func didToggle(isOn: Bool) {
        print("Toggle status: \(isOn)")
    }


}

 
