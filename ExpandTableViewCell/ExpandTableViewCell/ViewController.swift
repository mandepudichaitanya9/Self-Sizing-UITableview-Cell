//
//  ViewController.swift
//  ExpandTableViewCell
//
//  Created by chaitanya on 1/24/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var expandedcell:IndexSet = []
    
    var names = ["Anish", "Ashok", "Chaitanya","Akash"]
    
    
    var text = ["Swift is a powerful and intuitive programming language for iOS, iPadOS, macOS, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design and produces software that runs lightning-fast.",
        "Swift is a powerful and intuitive programming language for iOS, iPadOS, macOS, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design and produces software that runs lightning-fast.",
                "Swift is a powerful and intuitive programming language for iOS, iPadOS, macOS, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design and produces software that runs lightning-fast.","Swift is a powerful and intuitive programming language for iOS, iPadOS, macOS, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design and produces software that runs lightning-fast."]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailTableViewCell else {return UITableViewCell()}
        cell.textLbl.text = text[indexPath.row]
        cell.nameLbl.text = names[indexPath.row]
        
        if expandedcell.contains(indexPath.row) {
            cell.textLbl.numberOfLines = 0
            cell.moreBtn.setTitle("See Less", for: .normal)
        }else {
            cell.textLbl.numberOfLines = 3
        }
        
        
        
        // Button Actions
        cell.butttonClicked = {
            if self.expandedcell.contains(indexPath.row) {
                self.expandedcell.remove(indexPath.row)
            }else {
                self.expandedcell.insert(indexPath.row)
            }
            
            tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.expandedcell.contains(indexPath.row) {
            self.expandedcell.remove(indexPath.row)
        }else {
            self.expandedcell.insert(indexPath.row)
        }
        
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
}
