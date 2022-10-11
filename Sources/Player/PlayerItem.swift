//
//  Copyright (c) SRG SSR. All rights reserved.
//
//  License information is available from the LICENSE file.
//

import AVFoundation

public extension AVPlayerItem {
    /// Create a player item from a URL.
    /// - Parameters:
    ///   - url: The URL to play.
    ///   - automaticallyLoadedAssetKeys: The asset keys to load before the item is ready to play.
    convenience init(url: URL, automaticallyLoadedAssetKeys keys: [String]) {
        let asset = AVURLAsset(url: url)
        self.init(asset: asset, automaticallyLoadedAssetKeys: keys)
    }
}