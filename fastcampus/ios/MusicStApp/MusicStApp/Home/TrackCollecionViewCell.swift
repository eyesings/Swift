//
//  TrackCollecionViewCell.swift
//  MusicStApp
//
//  Created by RadCns_KIM_TAEWON on 2021/07/08.
//

import UIKit

class TrackCollecionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    override class func awakeFromNib() {
        
    }
    
    func updateUI(item: Track?) {
        
        guard let track = item else { return }
        self.trackThumbnail.image = track.artWork
        self.trackTitle.text = track.title
        self.trackArtist.text = track.artist
    }
}
