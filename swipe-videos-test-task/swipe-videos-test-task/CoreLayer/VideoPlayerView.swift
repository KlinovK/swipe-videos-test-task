//
//  VideoPlayerView.swift
//  swipe-videos-test-task
//
//  Created by Константин Клинов on 04/06/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewRepresentable {
    var videoName: String
    var isActive: Bool
    
    init(videoName: String, isActive: Bool) {
        self.videoName = videoName
        self.isActive = isActive
    }
    
    func makeUIView(context: Context) -> LoopingPlayerUIView {
        let view = LoopingPlayerUIView(videoName: videoName)
        if isActive {
            view.play()
        }
        return view
    }
    
    func updateUIView(_ uiView: LoopingPlayerUIView, context: Context) {
        if isActive {
            uiView.play()
        } else {
            uiView.pause()
        }
    }
}

class LoopingPlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    private var player = AVQueuePlayer()
    
    init(videoName: String) {
        guard let path = Bundle.main.path(forResource: videoName, ofType: "mp4") else {
            fatalError("Video file \(videoName).mp4 not found")
        }
        let url = URL(fileURLWithPath: path)
        let asset = AVURLAsset(url: url)
        let item = AVPlayerItem(asset: asset)
        
        super.init(frame: .zero)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        playerLooper = AVPlayerLooper(player: player, templateItem: item)        
        player.isMuted = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
}
