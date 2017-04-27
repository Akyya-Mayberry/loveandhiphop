//
//  TopMusicViewController.swift
//  LoveAndHiphop
//
//  Created by Mogulla, Naveen on 4/25/17.
//  Copyright © 2017 Mogulla, Naveen. All rights reserved.
//

import UIKit
import AVFoundation
import Parse

class TopMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var player: AVAudioPlayer = AVAudioPlayer()
    var player2: AVPlayer?
    var player2Item: AVPlayerItem?
    
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let query = PFQuery(className: "topMusic")
        query.whereKey("song_id", equalTo: "drake001")
        
        query.getFirstObjectInBackground { (topMusicObject: PFObject?, error: Error?) in
            if error == nil {
                if let topMusicObject = topMusicObject {
                    let songFile = topMusicObject["song_file"] as! PFFile
                    let audioFileURL: String = songFile.url!
                    print(audioFileURL)
                    
                    let songURL = URL(string: audioFileURL)
                    //////
                    
                    self.player2Item = AVPlayerItem(url: songURL!)
                    
                    self.player2 = AVPlayer(playerItem: self.player2Item)
                    
                    let playerLayer = AVPlayerLayer(player: self.player2!)
                    playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
                    self.view.layer.addSublayer(playerLayer)
                    
                    
                    
                    
                    
                    /*
                    
                    
                    
                    
                    do{
                        try self.player = AVAudioPlayer(contentsOf: songURL!)
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                 
                    */
                }
            }
        }
        
//        
//        do {
//            let audioPath = Bundle.main.path(forResource: "Drake-song1", ofType: "mp3")
//            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
//        } catch {
//            print("something happened")
//        }
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickPlayButton(_ sender: Any) {
        print("Play button tapped")
        player2?.play()
    }

    @IBAction func onClickStopButton(_ sender: Any) {
        player2?.pause()
    }
    
    
    @IBAction func onClickTopListenersButton(_ sender: Any) {
    }
    
    
    /*
    func play(url:  String) {
        print("playing \(url)")
        
        do {
            
            let playerItem = AVPlayerItem(URL(string: url))
            
            self.player = try AVPlayer(playerItem:playerItem)
            player!.volume = 1.0
            player!.play()
        } catch let error as NSError {
            self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
 */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        
        cell.songName.text = "My First Song"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "    Top play list of the week  "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
