//
//  HomeViewController.swift
//  MetronomoIOS
//
//  Created by Arthur Luiz Lara Quites on 17/01/20.
//  Copyright © 2020 Arthur Luiz Lara Quites. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    @IBOutlet var sliderNumero: UILabel!
    @IBOutlet var slider: UISlider!
    var playing:Bool = false
    var sliderValue: Double?
    var urlSound:URL?
    var player: AVAudioPlayer?
    let secondsInMinute: Double = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.updateMetronomo(sender: self.slider)
            self.urlSound = Bundle.main.url(forResource: "beep", withExtension: "wav")
            guard let urlSound = self.urlSound else { return }

            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            self.player = try AVAudioPlayer(contentsOf: urlSound, fileTypeHint: AVFileType.wav.rawValue)
            guard nil != self.player else { return }
            self.player!.prepareToPlay()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {return .portrait}
    
    @IBAction func start() {
        if(!self.playing){
            let queue = DispatchQueue(
                label: "ConcurrentQueue",
                qos: .userInitiated,
                attributes: [.concurrent]
            )
            
            var data = Date()
            
            queue.async {
                self.playing = true
                while(self.playing){
                    if(Date().timeIntervalSince(data) > self.findBpmInterval(bpm: self.sliderValue!.rounded(FloatingPointRoundingRule.down))){
                        data = Date()
                        self.playSound()
                    }
                }
            }
        }
    }
    
    @IBAction func stop() {
        self.playing = false;
    }
    
    @IBAction func updateMetronomo(sender:UISlider) {
        self.updateBPMNumer()
        self.sliderValue = Double(sender.value)
    }
    
    private func findBpmInterval(bpm:Double) -> Double{
        return self.secondsInMinute/bpm
    }
    
    private func updateBPMNumer(){
        self.sliderNumero.text = "\(Int(slider.value)) bpm"
    }
    
    func playSound() {
        do {
            self.player = try AVAudioPlayer(contentsOf: self.urlSound!, fileTypeHint: AVFileType.wav.rawValue)

            guard let player = self.player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
