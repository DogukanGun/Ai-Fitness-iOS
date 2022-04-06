//
//  WorkoutVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation
import UIKit

struct WorkoutVariables{
    static let cellIdentifier = "WorkoutCollectionViewCell"
    static let cellNibName = "WorkoutCollectionViewCell"
    static let collectionViewInset = UIEdgeInsets(top: CGFloat(10), left: CGFloat(5), bottom: CGFloat(10), right: CGFloat(5))
    static let collectionViewItemPerRow = CGFloat(2)
    static let collectionViewSpacing = CGFloat(0)
    static let segueIdentifierToWorkoutDetail = "WorkoutDetailVC"
}

class WorkoutVC:UIViewController{
    @IBOutlet weak var workoutCollectionList: UICollectionView!
    var presenter:ViewToPresenterWorkoutProtocol? = nil
    var workoutList = [Workout]()
    let alert = LoadingViewVC.instance

    
    override func viewDidLoad() {
        WorkoutRouter.createModule(ref: self)
        setCollectionView()
        navigationItem.setNavigationBar()
        navigationController?.setBarButtons(navigationItem: navigationItem)
        tabBarController?.setTabbar()
        
    }
    
    private func setCollectionView(){
        workoutCollectionList.register(UINib(nibName: WorkoutVariables.cellNibName, bundle: nil), forCellWithReuseIdentifier: WorkoutVariables.cellIdentifier)
        workoutCollectionList.delegate = self
        workoutCollectionList.dataSource = self
        let itemSize = workoutCollectionList.getSpace(width: view.bounds.width, sectionInsets: WorkoutVariables.collectionViewInset, itemsPerRow: WorkoutVariables.collectionViewItemPerRow, height: Int(workoutCollectionList.bounds.height))
        workoutCollectionList.setDesign(itemPerRow: Int(WorkoutVariables.collectionViewItemPerRow), inset: WorkoutVariables.collectionViewInset, spacing: WorkoutVariables.collectionViewSpacing, itemSize: itemSize)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        alert.showAlert()
        presenter?.getWorkouts()
    }
}

extension WorkoutVC:PresenterToViewWorkoutProtocol{
    func sendWorkouts(workouts: [Workout]) {
        self.workoutList = workouts
        alert.hideView()
        DispatchQueue.main.async {
            self.workoutCollectionList.reloadData()
        }
    }
}

extension WorkoutVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutVariables.cellIdentifier, for: indexPath) as?  WorkoutCollectionViewCell else {
            return UICollectionViewCell()
        }
        let workout = workoutList[indexPath.row]
        cell.refresh(workout: workout)
        cell.delegate = self
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == WorkoutVariables.segueIdentifierToWorkoutDetail{
            let vc = segue.destination as! WorkoutDetailVC
            let workout = sender as! Workout
            vc.workout = workout
        }
    }
}

extension WorkoutVC:WorkoutCellDelegate{
    func workoutItemClicked(workout: Workout) {
        performSegue(withIdentifier: WorkoutVariables.segueIdentifierToWorkoutDetail, sender: workout)
    }
    
}


