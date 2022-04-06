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
    var formFields = [UserForm.USERNAME,UserForm.NAME,UserForm.EMAIL,UserForm.PASSWORD]
    private var register = Register()
    let alert = LoadingViewVC.instance
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var presenter:ViewToPresenterUserOperationProtocol?
    
    override func viewDidLoad() {
        UserFormRouter.createModule(ref: self)
        setTableView()
        button.reshape()
        button.titleLabel?.text = UserFormVariable.segmentButtonRegister
        addSegmentButton()
        navigationItem.setNavigationBar()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
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
            formFields = [UserForm.USERNAME,UserForm.PASSWORD,UserForm.NAME,UserForm.EMAIL]
            button.titleLabel?.text = UserFormVariable.segmentButtonRegister
        }
        button.titleLabel?.textAlignment = .center
        register.clear()
        form.reloadData()
    }
    
    @IBAction func buttonPressed(){
        alert.showAlert()
        if(formFields.contains(UserForm.EMAIL)){
            let regiterRequest = RegisterRequest(name: register.name, username: register.username, password: register.password, email: register.email)
            presenter?.register(registerRequest: regiterRequest)
        }else{
            let loginRequest = LoginRequest(username: register.username, password: register.password)
            button.titleLabel?.text = UserFormVariable.segmentButtonLogin
            presenter?.login(loginRequest: loginRequest)
        }
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
        cell.selectionStyle = .none
        cell.delegate = self
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
            case .EMAIL:
                register.email = value
        }
    }
    
}

extension UserFormVC:PresenterToViewUserOperationProtocol{
    func response(response: UserResponse) {
        alert.hideView()
        if(response.success){
            changeStoryboard()
        }else{
            let alert = CustomDialogVC.instance
            let content = CustomDialogContent(title: "Internet Fail", message: "Please try again later.", positiveButtonText: "Okay", negativeButtonText: nil, buttonDelegate: self)
            alert.customDialogContent = content
            alert.showAlert()
        }
    }
}

extension UserFormVC:CustomDialogButtonDelegate{
    func positiveButtonPressed() {
        
    }
    
    func negativeButtonPressed() {
        
    }
    
    
}

protocol UserFormProtocol{
    func userFormProtocol(cell:UserForm,_ value:String)
}
 

