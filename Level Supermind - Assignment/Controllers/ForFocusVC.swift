//
//  ForFocusVC.swift
//  Level Supermind - Assignment
//
//  Created by Ameya Chorghade on 24/04/24.
//

import UIKit
import AVFoundation

class ForFocusVC: UIViewController {
    
    // MARK: Properties
    
    var player: AVAudioPlayer?
    var currentSong: Song?
    var isPlaying = false
    var timer: Timer?
    
    // MARK: IBOutlets
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSong()
    }
    
    
    func loadSong() {
        let sampleSong = Song(title: "Example Song",
                              artist: "Example Artist",
                              duration: 60,
                              audioURL: Bundle.main.url(forResource: "raag-pilu-mix-full-vers", withExtension: "mp3")!)
        currentSong = sampleSong
        setupPlayer(with: sampleSong)
    }
    
    func setupPlayer(with song: Song) {
        do {
            player = try AVAudioPlayer(contentsOf: song.audioURL)
            player?.delegate = self
            slider.maximumValue = Float(player?.duration ?? 0)
        } catch {
            print("Failed to create audio player: \(error)")
        }
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if isPlaying {
            player?.pause()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            timer?.invalidate()
        } else {
            player?.play()
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            startSliderTimer()
        }
        isPlaying.toggle()
    }
    
    func startSliderTimer() {
           timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
       }
       
       @objc func updateSlider() {
           slider.value = Float(player?.currentTime ?? 0)
       }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        player?.currentTime = TimeInterval(sender.value)
    }

    @IBAction func sliderTouchUpInside(_ sender: UISlider) {
        if isPlaying {
            player?.play()
        }
    }

    @IBAction func sliderTouchDown(_ sender: UISlider) {
        if isPlaying {
            player?.pause()
        }
    }
}

extension ForFocusVC: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        isPlaying = false
    }
}
