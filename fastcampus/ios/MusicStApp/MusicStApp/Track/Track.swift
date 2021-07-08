//
//  Track.swift
//  MusicStApp
//
//  Created by RadCns_KIM_TAEWON on 2021/07/08.
//

import UIKit

struct Track {
    let title: String
    let artist: String
    let albumName: String
    let artWork: UIImage
    
    init(title: String, artist: String, albumName: String, artWork: UIImage) {
        self.title = title
        self.artist = artist
        self.albumName = albumName
        self.artWork = artWork
    }
}

struct Album {
    let title: String
    let tracks: [Track]
    
    var thumbnail: UIImage? {
        return tracks.first?.artWork
    }
    
    var artist: String? {
        return tracks.first?.artist
    }
    
    init(title: String, tracks: [Track]) {
        self.title = title
        self.tracks = tracks
    }
}
