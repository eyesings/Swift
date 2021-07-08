//
//  Extension+AVPlayerItem.swift
//  MusicStApp
//
//  Created by RadCns_KIM_TAEWON on 2021/07/08.
//

import AVFoundation
import UIKit

extension AVPlayerItem {
    func convertoToTrack() -> Track? {
        let metadataList = asset.metadata
        
        var trackTitle: String?
        var trackArtist: String?
        var trackAlbumName: String?
        var trackArtWork: UIImage?
        
        for metadata in metadataList {
            if let title = metadata.title {
                trackTitle = title
            }
            
            if let artist = metadata.artist {
                trackArtist = artist
            }
            
            if let albumName = metadata.albumName {
                trackAlbumName = albumName
            }
            
            if let artWork = metadata.artWork {
                trackArtWork = artWork
            }
            
        }
        
        guard let title = trackTitle,
              let artist = trackArtist,
              let albumName = trackAlbumName,
              let artWork = trackArtWork else {
            return nil
        }
        
        return Track(title: title, artist: artist, albumName: albumName, artWork: artWork)
    }
}

extension AVMetadataItem {
    var title: String? {
        guard let key = commonKey?.rawValue, key == "title" else {
            return nil
        }
        return stringValue
    }
    
    var artist: String? {
        guard let key = commonKey?.rawValue, key == "artist" else {
            return nil
        }
        return stringValue
    }
    
    var albumName: String? {
        guard let key = commonKey?.rawValue, key == "albumName" else {
            return nil
        }
        return stringValue
    }
    
    var artWork: UIImage? {
        guard let key = commonKey?.rawValue, key == "artwork", let data = dataValue, let image = UIImage(data: data) else {
            return nil
        }
        
        return image
    }
}

extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else {
            return false
        }
        return self.rate != 0
    }
}
