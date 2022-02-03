//
//  UserFormVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/12/21.
//

import Foundation
import UIKit
import Alamofire

struct UserFormVariable{
    static let cellIdentifier = "UserFormCell"
    static let nibName = "FormCell"
    static let segmentTextSize = 20
    static let segmentButtonLogin = "Login"
    static let segmentButtonRegister = "Register"
    static let seperatorColor = UIColor(named: "TabbarColor")
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
    var formFields = [UserForm.USERNAME,UserForm.PASSWORD,UserForm.NAME,UserForm.SURNAME,UserForm.BIRTHDAY]
    private var register = Register()
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        setTableView()
        button.reshape()
        button.titleLabel?.text = UserFormVariable.segmentButtonRegister
        addSegmentButton()
        navigationItem.setNavigationBar()
        
    }
    
    private func setTableView(){
        form.alwaysBounceVertical = false
        form.delegate = self
        form.dataSource = self
        form.contentInset = UIEdgeInsets(top: UserFormVariable.TableViewCellPadding.tableViewCellHeight/CGFloat(formFields.count), left: 0, bottom: 0, right: 0)
        form.register(UINib(nibName:UserFormVariable.nibName , bundle: nil), forCellReuseIdentifier: UserFormVariable.cellIdentifier)
        form.separatorColor = UserFormVariable.seperatorColor
    }
    private func addSegmentButton(){
        let font = UIFont.systemFont(ofSize: CGFloat(UserFormVariable.segmentTextSize))
        segmentControl.setTitle(UserFormVariable.segmentButtonLogin, forSegmentAt: 1)
        segmentControl.setTitle(UserFormVariable.segmentButtonRegister, forSegmentAt: 0)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: font], for: .normal)

    }
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == UserFormVariable.segmentButtonLogin{
            formFields = [UserForm.USERNAME,UserForm.PASSWORD]
            button.titleLabel?.text = UserFormVariable.segmentButtonLogin
        }else if sender.titleForSegment(at: sender.selectedSegmentIndex) == UserFormVariable.segmentButtonRegister{
            formFields = [UserForm.USERNAME,UserForm.PASSWORD,UserForm.NAME,UserForm.SURNAME,UserForm.BIRTHDAY]
            button.titleLabel?.text = UserFormVariable.segmentButtonRegister
        }
        button.titleLabel?.textAlignment = .center
        form.reloadData()
    }
    
    @IBAction func buttonPressed(){
        /*AF.request("url", method: .post, parameters: register, encoder: .json, headers: nil, interceptor: nil, requestModifier: nil).validate()
            .responseData { AFdata in
                
            }*/
        changeStoryboard()
    }
    
    private func changeStoryboard(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainStoryboard") as! UITabBarController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible() 
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

extension UserFormVC:UserFormProtocol{
    func userFormProtocol(cell: UserForm, _ value: String) {
        switch cell {
            case .PASSWORD:
                register.password = value
            case .NAME:
                register.name = value
            case .SURNAME:
                register.surname = value
            case .USERNAME:
                register.username = value
            case .TELEPHONE:
                register.telNumber = value
            case .BIRTHDAY:
                register.birthday = value
        }
    }
    
}

protocol UserFormProtocol{
    func userFormProtocol(cell:UserForm,_ value:String)
}
 
