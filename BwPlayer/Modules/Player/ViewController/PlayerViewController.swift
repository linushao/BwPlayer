//
//  PlayerViewController.swift
//  BwPlayer
//
//  Created by ace on 2024/5/8.
//

import UIKit
import SwifterSwift

class PlayerViewController: UIViewController {
    
    var session: FFmpegSession?
    
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    lazy var command = "-i https://h5dfsg.anwangjd1.com/api/app/media/m3u8ex/135282?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJwdWJsaWMiLCJleHAiOjE3MTY0MzYyNDcsImlzc3VlciI6ImNvbS5idXR0ZXJmbHkiLCJzdWIiOiJhc2lnbiIsInVzZXJJZCI6Mjk2Mzc1Mn0.ZgY895fSDbCgd1x5Yuru5ce0IjQoHfT-m1A3K8bhmzg \(documentsDirectory)广西少女贩卖到缅北园区被黑人爆操-黑人光天化日下强操居民看到避而远之.mp4"

    override func viewDidLoad() {
        super.viewDidLoad()

//        FFmpegSession *session = [FFmpegKit execute:@"-i file1.mp4 -c:v mpeg4 file2.mp4"];
        
//        NSString *audioSampleFile = [self getChromaprintSamplePath];
//        [[NSFileManager defaultManager] removeItemAtPath:audioSampleFile error:NULL];
        
        
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        print(documentsDirectory)
        
//        let documentsPath = documentsDirectory.absoluteString
        
//        session = FFmpegKit.execute(command)
        
        session = FFmpegKit.executeAsync(command) {
            let state = $0?.getState()
            let returnCode = $0?.getReturnCode()
            
            if let allLogs = $0?.getAllLogsAsString() {
                print(allLogs)
            }
        }
        
        DispatchQueue.main.asyncAfter(delay: 5) {
            FFmpegKit.cancel(self.session!.getId())
        }
        
    }

}
