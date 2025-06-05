//
//  VideoPlayerView.swift
//  swipe-videos-test-task
//
//  Created by Константин Клинов on 04/06/25.
//

import SwiftUI
import AVKit

/// A SwiftUI view that displays a looping video player using UIKit's AVPlayer.
///
/// Wraps a `LoopingPlayerUIView` to play a video file in a SwiftUI app, with play/pause control based on activity state.
struct VideoPlayerView: UIViewRepresentable {
    /// The name of the video file (without extension) to play.
    var videoName: String
    
    /// Indicates whether the video should be playing.
    var isActive: Bool
    
    /// Initializes the view with a video name and activity state.
    ///
    /// - Parameters:
    ///   - videoName: The name of the video file (without .mp4 extension).
    ///   - isActive: Whether the video should play.
    init(videoName: String, isActive: Bool) {
        self.videoName = videoName
        self.isActive = isActive
    }
    
    /// Creates and configures the `LoopingPlayerUIView`.
    ///
    /// - Parameter context: SwiftUI context.
    /// - Returns: A configured `LoopingPlayerUIView`.
    func makeUIView(context: Context) -> LoopingPlayerUIView {
        let view = LoopingPlayerUIView(videoName: videoName)
        if isActive {
            view.play()
        }
        return view
    }
    
    /// Updates the `LoopingPlayerUIView` based on the activity state.
    ///
    /// - Parameters:
    ///   - uiView: The `LoopingPlayerUIView` to update.
    ///   - context: SwiftUI context.
    func updateUIView(_ uiView: LoopingPlayerUIView, context: Context) {
        if isActive {
            uiView.play()
        } else {
            uiView.pause()
        }
    }
}

/// A UIKit view that plays a looping video using AVPlayer.
///
/// Manages video playback with looping functionality and audio session setup.
class LoopingPlayerUIView: UIView {
    /// The AVPlayerLayer for rendering the video.
    private var playerLayer = AVPlayerLayer()
    
    /// The AVPlayerLooper for enabling video looping.
    private var playerLooper: AVPlayerLooper?
    
    /// The AVQueuePlayer for video playback.
    private var player = AVQueuePlayer()
    
    /// Initializes the view with a video file.
    ///
    /// - Parameter videoName: The name of the video file (without .mp4 extension).
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
    
    /// Required initializer for NSCoder, not implemented.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Updates the player layer frame to match the view's bounds.
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    /// Starts video playback.
    func play() {
        player.play()
    }
    
    /// Pauses video playback.
    func pause() {
        player.pause()
    }
}
