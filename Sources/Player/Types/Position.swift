//
//  Copyright (c) SRG SSR. All rights reserved.
//
//  License information is available from the LICENSE file.
//

import CoreMedia

/// A description for a position to reach.
public struct Position {
    /// The time to reach.
    public let time: CMTime

    /// The tolerance allowed before the time to reach.
    public let toleranceBefore: CMTime

    /// The tolerance allowed after the time to reach.
    public let toleranceAfter: CMTime

    fileprivate init(time: CMTime, toleranceBefore: CMTime, toleranceAfter: CMTime) {
        self.time = time
        self.toleranceBefore = toleranceBefore
        self.toleranceAfter = toleranceAfter
    }
}

/// Returns a position with explicitly associated tolerances.
///
/// - Parameters:
///   - time: The time to reach.
///   - toleranceBefore: The tolerance allowed before the time to reach.
///   - toleranceAfter: The tolerance allowed after the time to reach.
/// - Returns: A position.
public func to(_ time: CMTime, toleranceBefore: CMTime, toleranceAfter: CMTime) -> Position {
    .init(time: time, toleranceBefore: toleranceBefore, toleranceAfter: toleranceAfter)
}

/// Returns a precise position.
///
/// - Parameter time: The time to reach.
/// - Returns: A position.
public func at(_ time: CMTime) -> Position {
    .init(time: time, toleranceBefore: .zero, toleranceAfter: .zero)
}

/// Returns an approximate position.
///
/// - Parameter time: The time to reach.
/// - Returns: A position.
public func near(_ time: CMTime) -> Position {
    .init(time: time, toleranceBefore: .positiveInfinity, toleranceAfter: .positiveInfinity)
}

/// Returns an approximate position always located before the specified time.
///
/// - Parameter time: The time to reach.
/// - Returns: A position.
public func before(_ time: CMTime) -> Position {
    .init(time: time, toleranceBefore: .positiveInfinity, toleranceAfter: .zero)
}

/// Returns an approximate position always located after the specified time.
/// 
/// - Parameter time: The time to reach.
/// - Returns: A position.
public func after(_ time: CMTime) -> Position {
    .init(time: time, toleranceBefore: .zero, toleranceAfter: .positiveInfinity)
}
