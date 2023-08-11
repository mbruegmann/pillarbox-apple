//
//  Copyright (c) SRG SSR. All rights reserved.
//
//  License information is available from the LICENSE file.
//

@testable import Player

import AVFoundation
import Circumspect
import Streams
import XCTest

final class AVPlayerChunkDurationPublisherTests: TestCase {
    func testPlayback() {
        let item = AVPlayerItem(url: Stream.shortOnDemand.url)
        let player = AVPlayer(playerItem: item)
        expectAtLeastEqualPublished(
            values: [.invalid, CMTime(value: 1, timescale: 1)],
            from: player.chunkDurationPublisher()
        )
    }

    func testEntirePlayback() {
        let item = AVPlayerItem(url: Stream.shortOnDemand.url)
        let player = AVPlayer(playerItem: item)
        expectAtLeastEqualPublished(
            values: [.invalid, CMTime(value: 1, timescale: 1)],
            from: player.chunkDurationPublisher()
        ) {
            player.play()
        }
    }

    func testEntirePlaybackInQueuePlayerAdvancingAtItemEnd() {
        let item = AVPlayerItem(url: Stream.shortOnDemand.url)
        let player = AVQueuePlayer(playerItem: item)
        player.actionAtItemEnd = .advance
        expectAtLeastEqualPublished(
            values: [.invalid, CMTime(value: 1, timescale: 1), .invalid],
            from: player.chunkDurationPublisher()
        ) {
            player.play()
        }
    }

    func testEntirePlaybackInQueuePlayerPausingAtItemEnd() {
        let item = AVPlayerItem(url: Stream.shortOnDemand.url)
        let player = AVQueuePlayer(playerItem: item)
        player.actionAtItemEnd = .pause
        expectAtLeastEqualPublished(
            values: [.invalid, CMTime(value: 1, timescale: 1)],
            from: player.chunkDurationPublisher()
        ) {
            player.play()
        }
    }

    func testDuringItemChange() {
        let item1 = AVPlayerItem(url: Stream.shortOnDemand.url)
        let item2 = AVPlayerItem(url: Stream.onDemand.url)
        let player = AVQueuePlayer(items: [item1, item2])
        expectAtLeastEqualPublished(
            values: [
                .invalid,
                CMTime(value: 1, timescale: 1),
                .invalid,
                CMTime(value: 4, timescale: 1)
            ],
            from: player.chunkDurationPublisher()
        ) {
            player.play()
        }
    }
}
