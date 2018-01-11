//
//  ViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q  on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class MainWeatherViewController: UIViewController {

    let cellSpacing = UIScreen.main.bounds.width * 0.05
    
    var mainWeatherView: MainWeatherView!
    
    var zipcode: String = "" {
        didSet {
            //to do
                //save zip code in user defaults
                //trigger load data with new zipcode
            print("zipcode saved!!")
        }
    }
    
//    var weathers: //datasource variable, to do
    //if this is empty, it should use remove label animation - or maybe make it happen in network requests
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Search"
        //load the actual zipcode first, to get city, then use dependency injection to pass the city and info to the main weather view, which will have a function that sets up all that stuff using the info that was passed in
        
        setUpMainWeatherView()
        
        //figure out collection view and labels and stuff?
        setUpCollectionView()
        setUpZipcodeTextField()
    }
    
    func setUpMainWeatherView() {
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
        
        mainWeatherView = MainWeatherView(frame: safeAreaLayoutGuide.layoutFrame)
        
        self.view.addSubview(mainWeatherView)
        
        self.mainWeatherView.translatesAutoresizingMaskIntoConstraints = false
        self.mainWeatherView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        self.mainWeatherView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.mainWeatherView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.mainWeatherView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setUpCollectionView() {
        mainWeatherView.collectionView.delegate = self
        mainWeatherView.collectionView.dataSource = self
        
        //to do - set up data source variable?
    }
    
    func setUpZipcodeTextField() {

        mainWeatherView.zipcodeTextField.delegate = self
        
        //to do - load saved zipcode?
    }

}

//MARK: - Collection View Delegate Flow Layout Methods
extension MainWeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells: CGFloat = 2.5
        let numberOfSpaces: CGFloat = numberOfCells + 1
        let width = (collectionView.bounds.width - (numberOfSpaces * cellSpacing)) / numberOfCells
        let height = collectionView.bounds.height - (cellSpacing * 2)
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}

//MARK: - Collection View Delegate Methods
extension MainWeatherViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }
        
        let detailedVC = DetailedWeatherViewController()
        
        detailedVC.modalPresentationStyle = .overCurrentContext
        detailedVC.modalTransitionStyle = .coverVertical
        
        //Extra Credit
        
        //got the idea for this animation code here: https://codepad.co/snippet/vE7tduOt
        
        UIView.animate(withDuration: 0.20, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 5, options: [], animations: {
            
            cell.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
            
        }, completion: { (_) in

            UIView.animateKeyframes(withDuration: 0.20, delay: 0, options: [.calculationModeCubicPaced], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.10, animations: {
                    
                    cell.transform = CGAffineTransform(scaleX: 1, y: 1.0)
                
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.10, relativeDuration: 0.90, animations: {
                    
                    self.present(detailedVC, animated: true, completion: nil)
                    
                })
                
                
            }, completion: nil)
            
        })
        
        //to do, should trigger programmatic segue to detailed view
        //pass in info
    }
    
}

//MARK: - Collection View Data Source Methods
extension MainWeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! MainWeatherCollectionViewCell
        
        //to do - make custom table view cell
        cell.configureCell()
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 15
        
        return cell
    }
    
}

//MARK: - Text Field Delegate Methods
extension MainWeatherViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if "0123456789".contains(string) || string == "" {
            return true
        }
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let zipcode = textField.text {
            self.zipcode = zipcode
        }
        
        if zipcode == "10002" {
            mainWeatherView.animateRemoveNoResultsLabel()
        } else {
            mainWeatherView.animateAddNoResultsLabel()
        }
        return true
    }
    
}

