//
//  MainpageVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/20/21.
//

import Foundation
import UIKit
struct MainpageVariable{
    static let cellIdentifier = "MainpageSportMovementCollectionViewCell"
    static let cellNibName = "MainpageSportMovementCollectionViewCell"

    
}
class MainpageVC:UIViewController{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var collectionViewTitle: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let alert = LoadingViewVC.instance
    var presenter:ViewToPresenterMainpageProtocol?
    var sports = [Workout]()
    private let itemsPerRow:CGFloat=2
    private let sectionInsets = UIEdgeInsets(top: 0, left: 15.0, bottom: 0, right: 10.0)
    override func viewDidLoad() {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width,height: scrollView.frame.size.height);
        tabBarController?.setTabbar()
        navigationItem.setNavigationBar()
        navigationController?.setBarButtons(navigationItem: navigationItem)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool) {
        createView()
    }
    private func createView(){
        createCollectionView()
        prepareSearchBar()
        MainpageRouter.createModule(ref: self)
        alert.showAlert()
        presenter?.getAllData()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func createCollectionView(){
        collection.register(UINib(nibName: MainpageVariable.cellNibName, bundle: nil), forCellWithReuseIdentifier: MainpageVariable.cellIdentifier)
        collection.delegate = self
        collection.dataSource = self
    }
    
    func prepareSearchBar(){
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.white
            textfield.leftView?.tintColor = UIColor.white
            var frame = textfield.frame
            frame.size.height = frame.size.height + 100
            textfield.frame = frame
            textfield.backgroundColor = UIColor(named: "TabbarColor")
        }
        searchBar.delegate = self
    }
    
}

extension MainpageVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainpageVariable.cellIdentifier, for: indexPath) as? MainpageSportMovementCollectionViewCell else{
            return UICollectionViewCell()
        }
        let sport = sports[indexPath.row]
        cell.refresh(sportMovement: sport)
        return cell
    }
    
    
}

extension MainpageVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collection.getSpace(width:collection.frame.width,sectionInsets: sectionInsets, itemsPerRow: itemsPerRow, height: 500)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                return sectionInsets
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                return sectionInsets.left
        }
}

extension MainpageVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text, text != ""{
            presenter?.searchData(word:text)
        }else{
            presenter?.getAllData()
        }
    }
}


extension MainpageVC:PresenterToViewMainpageProtocol{
    func sendDataToView(data: [Workout]) {
        self.sports = data
        alert.hideView()
        collection.reloadData()
    }
}
