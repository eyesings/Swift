//
//  TrackManager.swift
//  MusicStApp
//
//  Created by RadCns_KIM_TAEWON on 2021/07/08.
//

import UIKit
import AVFoundation

class TrackManager {
    
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    init() {
        let tracks = loadTracks()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement()
    }
    
    func loadTracks() -> [AVPlayerItem] {
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        let items = urls.map { AVPlayerItem(url: $0)}
        return items
    }
    
    func track(at index: Int) -> Track? {
        let playItem = tracks[index]
        let track = playItem.convertoToTrack()
        print(track)
        return track
    }
    
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList: [Track] = tracks.compactMap { $0.convertoToTrack()}
        let albumDics = Dictionary(grouping: trackList, by: {track in track.albumName})
        var albums: [Album] = []
        for (key, value) in albumDics {
            let album = Album(title: key, tracks: value)
            albums.append(album)
        }
        return albums
    }
    
    func loadOthertodaysTrack() {
        self.todaysTrack = self.tracks.randomElement()
    }
}
