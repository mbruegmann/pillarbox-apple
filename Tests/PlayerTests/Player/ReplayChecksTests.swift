//
//  Copyright (c) SRG SSR. All rights reserved.
//
//  License information is available from the LICENSE file.
//

@testable import Player

import Nimble
import Streams

final class ReplayChecksTests: TestCase {
    func testEmptyPlayer() {
        let player = Player()
        expect(player.canReplay()).to(beFalse())
    }

    func testWithOneGoodItem() {
        let player = Player(item: .simple(url: Stream.shortOnDemand.url))
        expect(player.canReplay()).to(beFalse())
    }

    func testWithOneGoodItemPlayedEntirely() {
        let player = Player(item: .simple(url: Stream.shortOnDemand.url))
        player.play()
        expect(player.canReplay()).toEventually(beTrue())
    }

    func testWithOneBadItem() {
        let player = Player(item: .simple(url: Stream.unavailable.url))
        expect(player.canReplay()).toEventually(beTrue())
    }

    func testWithManyGoodItems() {
        let player = Player(items: [
            .simple(url: Stream.shortOnDemand.url),
            .simple(url: Stream.shortOnDemand.url)
        ])
        player.play()
        expect(player.canReplay()).toEventually(beTrue())
    }

    func testWithManyBadItems() {
        let player = Player(items: [
            .simple(url: Stream.unavailable.url),
            .simple(url: Stream.unavailable.url)
        ])
        player.play()
        expect(player.canReplay()).toEventually(beTrue())
    }

    func testWithOneGoodItemAndOneBadItem() {
        let player = Player(items: [
            .simple(url: Stream.shortOnDemand.url),
            .simple(url: Stream.unavailable.url)
        ])
        player.play()
        expect(player.canReplay()).toEventually(beTrue())
    }
}
