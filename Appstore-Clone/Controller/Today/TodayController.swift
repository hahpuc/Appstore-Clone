//
//  TodayController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 12/26/20.
//

import UIKit

class TodayController: VerticalController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "TodayCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        
        navigationController?.isNavigationBarHidden = true 
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellID)
    }

    
    // MARK: - Handle Action
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let appFullscreen = AppFullscreenController()
        let redView = appFullscreen.view!

        redView.layer.cornerRadius = 16
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedview)))
        view.addSubview(redView)
        
        addChild(appFullscreen)
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
        self.startingFrame = startingFrame
        redView.frame = startingFrame
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            redView.frame = self.view.frame
            
            self.tabBarController?.tabBar.frame.origin.y += 100

        }, completion: nil)
         
    }
    
    var startingFrame: CGRect?
    
    @objc func handleRemoveRedview(gesture: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut) {
            gesture.view?.frame = self.startingFrame ?? .zero
            
            // Show the tabBar
            self.tabBarController?.tabBar.frame.origin.y -= 100

        } completion: { _ in
            gesture.view?.removeFromSuperview()

        }

    }
    
    // MARK: - Set up CollectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TodayCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
