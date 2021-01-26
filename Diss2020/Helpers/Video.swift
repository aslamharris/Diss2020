//
//  Video.swift
//  Diss2020
//
//  Created by Harris Aslam on 14/07/2020.
//  Copyright © 2020 Harris Aslam. All rights reserved.
//

import Foundation

struct Video
{
    let authorName: String
    let videoFileName: String
    let description: String
    let thumbnailFileName: String
    
    static func fetchVideos() -> [Video] {
        let v1 = Video(authorName: "David Tran", videoFileName: "v1", description: "This is an example of a local video.", thumbnailFileName: "v1")
        let v2 = Video(authorName: "Tracy Noah", videoFileName: "v2", description: "This is an example of a local video.", thumbnailFileName: "v2")
        let v3 = Video(authorName: "Brendon Burchard", videoFileName: "v3", description: "This is an example of a local video.", thumbnailFileName: "v3")
        let v4 = Video(authorName: "Elon Musk", videoFileName: "v4", description: "This is an example of a local video.", thumbnailFileName: "v4")
        let v5 = Video(authorName: "Harris Aslam", videoFileName: "v5", description: "This is an example of a local video.", thumbnailFileName: "v5")
        let v6 = Video(authorName: "Steve Jobs", videoFileName: "v6", description: "This is an example of a local video.", thumbnailFileName: "v6")
        
        return [v1, v2, v3, v4, v5, v6]
    }
}
