//
//  ProfileMenuVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/29/21.
//

import Foundation
import UIKit

struct ProfileMenuVariable{
    static let cellNibName = "ProfileMenuTableViewCell"
    static let cellIdentifier = "ProfileMenuTableViewCell"
}
class ProfileMenuVC:UIViewController{
    var profileMenuList = [MenuItem]()
    var presenter:ProfileMenuPresenter?
    @IBOutlet weak var profileMenuTableView: UITableView!
    
    override func viewDidLoad() {
        profileMenuTableView.register(UINib(nibName: ProfileMenuVariable.cellNibName, bundle: nil), forCellReuseIdentifier: ProfileMenuVariable.cellIdentifier)
        ProfileMenuRouter.createModule(ref: self)
        presenter?.getAllMenu()
        navigationItem.setNavigationBar()
    }
}

extension ProfileMenuVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileMenuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMenuVariable.cellIdentifier, for: indexPath) as? ProfileMenuTableViewCell else{
            return UITableViewCell()
        }
        let menuItem = profileMenuList[indexPath.row]
        cell.refresh(menu: menuItem)
        return cell
        
    } 
}

extension ProfileMenuVC:PresenterToViewProfileMenuProtocol{
    func sendMenuItem(menuItems: [MenuItem]) {
        self.profileMenuList = menuItems
        profileMenuTableView.reloadData()
    } 
}
