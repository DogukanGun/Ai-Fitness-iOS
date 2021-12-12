//
//  UserFormVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/12/21.
//

import Foundation
import UIKit


struct UserFormVariable{
    static let cellIdentifier = "UserFormCell"
    static let nibName = "FormCell"
    struct TableViewCellPadding{
        static let topPadding = CGFloat(50)
        static let bottomPadding = CGFloat(50)
        static let leftPadding = CGFloat(0)
        static let rightPadding = CGFloat(0)
        static let tableViewCellHeight = CGFloat(200)
    }
    
    
}
class UserFormVC:UIViewController{
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var form: UITableView!
    var formFields = [UserForm]()
    var buttonText : String = ""
    
    override func viewDidLoad() {
        form.alwaysBounceVertical = false
        form.delegate = self
        form.dataSource = self
        form.contentInset = UIEdgeInsets(top: UserFormVariable.TableViewCellPadding.tableViewCellHeight/CGFloat(formFields.count), left: 0, bottom: 0, right: 0)
        form.register(UINib(nibName:UserFormVariable.nibName , bundle: nil), forCellReuseIdentifier: UserFormVariable.cellIdentifier)
        button.titleLabel?.text = buttonText
        
    }
    
}


extension UserFormVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserFormVariable.cellIdentifier, for: indexPath) as? FormCell else{
            return UITableViewCell()
        }
        cell.refresh(field: formFields[indexPath.row])
        cell.separatorInset = UIEdgeInsets(top: UserFormVariable.TableViewCellPadding.topPadding, left: UserFormVariable.TableViewCellPadding.leftPadding, bottom: UserFormVariable.TableViewCellPadding.bottomPadding, right: UserFormVariable.TableViewCellPadding.rightPadding)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formFields.count
    }
     
    
    
    
}
