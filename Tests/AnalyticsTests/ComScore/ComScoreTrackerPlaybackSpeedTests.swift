//
//  Copyright (c) SRG SSR. All rights reserved.
//
//  License information is available from the LICENSE file.
//

@testable import Analytics

import Nimble
import Player
import Streams

private struct AssetMetadataMock: AssetMetadata {}

final class ComScoreTrackerPlaybackSpeedTests: ComScoreTestCase {
    func testRateAtStart() {
        let player = Player(item: .simple(
            url: Stream.onDemand.url,
            metadata: AssetMetadataMock(),
            trackerAdapters: [
                ComScoreTracker.adapter { _ in .test }
            ]
        ))
        player.setDesiredPlaybackSpeed(0.5)

        expectAtLeastHits(
            .play { labels in
                expect(labels.ns_st_rt).to(equal(50))
            }
        ) {
            player.play()
        }
    }
}
