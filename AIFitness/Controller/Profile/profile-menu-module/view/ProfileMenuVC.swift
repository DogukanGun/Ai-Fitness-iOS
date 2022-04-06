//
//  ProfileMenuVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/29/21.
//

import Foundation
import UIKit
import PhotosUI

struct ProfileMenuVariable{
    static let cellNibName = "ProfileMenuTableViewCell"
    static let cellIdentifier = "ProfileMenuTableViewCell"
}
class ProfileMenuVC:UIViewController{
    var profileMenuList = [ProfileItem]()
    var presenter:ProfileMenuPresenter?
    var profile:Profile?
    let alert = LoadingViewVC.instance
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var profileMenuTableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        profileMenuTableView.register(UINib(nibName: ProfileMenuVariable.cellNibName, bundle: nil), forCellReuseIdentifier: ProfileMenuVariable.cellIdentifier)
        ProfileMenuRouter.createModule(ref: self)
        profileMenuTableView.delegate = self
        profileMenuTableView.dataSource = self
        saveButton.reshape()
        navigationItem.setNavigationBar()
        navigationController?.setBarButtons(navigationItem: navigationItem)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profilePhotoImageView.isUserInteractionEnabled = true
        profilePhotoImageView.addGestureRecognizer(tapGestureRecognizer)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createEmptyData()
        alert.showAlert()
        presenter?.getProfile()
    }
    
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    private func createEmptyData(){
        profileMenuList.removeAll()
        var item = ProfileItem(key: ProfileItemKeys.EMAIL.rawValue, value: "")
        profileMenuList.append(item)
        item = ProfileItem(key: ProfileItemKeys.PHONENUMBER.rawValue, value: "")
        profileMenuList.append(item)
        profileMenuTableView.reloadData()
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        getProfile()
        alert.showAlert()
        presenter?.saveProfile(profile: profile!)
    }
    
    private func getProfile(){
        for index in profileMenuList{
            if index.key == ProfileItemKeys.EMAIL.rawValue{
                profile?.email = index.value
            }else if index.key == ProfileItemKeys.PHONENUMBER.rawValue{
                profile?.phoneNumber = index.value
            }
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
    
}

extension ProfileMenuVC:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
       picker.dismiss(animated: true, completion: nil)
       
       for result in results {
          result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { (object, error) in
             if let image = object as? UIImage {
                DispatchQueue.main.async {
                    self.profilePhotoImageView.image = image
                    let imageData = image.jpegData(compressionQuality: 1)
                    if let base64Image = imageData?.base64EncodedString(){
                        self.alert.showAlert()
                        let imageRequest = ProfileImage(username: "", userPhoto: base64Image)
                        self.presenter?.saveProfileImage(profileImage: imageRequest)
                    }
                }
             }
          })
       }
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
        let profileItem = profileMenuList[indexPath.row]
        cell.refresh(profile: profileItem)
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
        
    } 
}

extension ProfileMenuVC:ProfileMenuTableViewCellProfileItemDelegate{
    func profileItemChanged(profileItem: ProfileItem) {
        for index in profileMenuList{
            if profileItem.key == index.key{
                index.value = profileItem.value!
            }
        }
        profileMenuTableView.reloadData()
    }
}

extension ProfileMenuVC:PresenterToViewProfileMenuProtocol{
    func sendProfile(profile: ProfileResponseData) {
        alert.hideView()
        for index in profileMenuList{
            if index.key == ProfileItemKeys.EMAIL.rawValue{
                index.value = profile.email
            }else if index.key == ProfileItemKeys.PHONENUMBER.rawValue{
                index.value = profile.phoneNumber
            }
        }
        if let photo = profile.userPhoto,let decodedData = Data(base64Encoded: photo, options: .ignoreUnknownCharacters) {
            profilePhotoImageView.image = UIImage(data: decodedData)
        }
        profileMenuTableView.reloadData()
    }
     
}
