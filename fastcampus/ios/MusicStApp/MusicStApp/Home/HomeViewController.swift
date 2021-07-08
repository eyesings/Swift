//
//  HomeViewController.swift
//  MusicStApp
//
//  Created by RadCns_KIM_TAEWON on 2021/07/08.
//

import UIKit

class HomeViewController: UIViewController {

    let trackManager: TrackManager = TrackManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trackManager.tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollecionViewCell", for: indexPath) as? TrackCollecionViewCell else {
            return UICollectionViewCell()
        }
        
        let track = trackManager.track(at: indexPath.item)
        cell.updateUI(item: track)
        
        return cell
    }

}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing: CGFloat = 20
        let margin: CGFloat = 20
        let width: CGFloat = (collectionView.bounds.width - itemSpacing - margin * 2) / 2
        let height: CGFloat = width + 60
        return CGSize(width: width, height: height)
    }
}
