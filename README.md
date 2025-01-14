<!-- markdownlint-disable-next-line MD041 -->
[![Pillarbox logo](docs/README-images/logo.jpg)](https://github.com/SRGSSR/pillarbox-apple)

# Overview

[![Releases](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSRGSSR%2Fpillarbox-apple%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/SRGSSR/pillarbox-apple) [![Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSRGSSR%2Fpillarbox-apple%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/SRGSSR/pillarbox-apple) [![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager) [![GitHub license](https://img.shields.io/github/license/SRGSSR/pillarbox-apple)](LICENSE)

Pillarbox is the iOS and tvOS modern reactive SRG SSR player ecosystem implemented on top of AVFoundation and AVKit. Pillarbox has been designed with robustness, efficiency and flexibilty in mind, with full customization of:

- Metadata and asset URL retrieval.
- Asset resource loading, including support for FairPlay.
- Analytics and QoS integration.
- User interface layout in SwiftUI.

Its robust player provides all essential playback features you might expect:

- Audio and video (standard / monoscopic 360°) playback.
- Support for on-demand and live streams (with or without DVR).
- First-class integration with SwiftUI to create the stunning playback user experience that your application deserves.
- Integration with the standard system playback user experience, both on iOS and tvOS.
- Playlist management including bidirectional navigation.
- Support for alternative audio tracks, Audio Description, subtitles, CC and SDH, all tightly integrated with standard system accessibility features.
- AirPlay compatibility.
- Control center integration.
- Multiple instance support.
- Best-in-class Picture in Picture support.
- The smoothest possible seek experience on Apple devices, with blazing-fast content navigation in streams enabled for trick play.
- Playback speed controls.

In addition Pillarbox provides the ability to play all SRG SSR content through a dedicated package.

# Showcase

Here are a few examples of layouts which can be achieved using Pillarbox and SwiftUI, directly borrowed from our demo project:

[![Showcase](docs/README-images/showcase.png)](https://github.com/SRGSSR/pillarbox-apple)

From left to right:

- Screenshots 1, 2 and 3: [Rich custom player user interface](Demo/Sources/Players/PlaybackView.swift).
- Screenshot 4: [Player with associated playlist](Demo/Sources/Showcase/Playlist/PlaylistView.swift).
- Screenshot 5: [Stories](Demo/Sources/Showcase/Stories/StoriesView.swift).

# Code example

With Pillarbox creating a custom video player user interface has never been easier. Simply instantiate a `Player` and start building your user interface in SwiftUI right away:

```swift
import Player
import SwiftUI

struct PlayerView: View {
    @StateObject private var player = Player(
        item: .simple(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8")!)
    )

    private var buttonImage: String {
        switch player.playbackState {
        case .playing:
            return "pause.circle.fill"
        default:
            return "play.circle.fill"
        }
    }

    var body: some View {
        ZStack {
            VideoView(player: player)
            Button(action: player.togglePlayPause) {
                Image(systemName: buttonImage)
                    .resizable()
                    .frame(width: 80, height: 80)
            }
        }
        .onAppear(perform: player.play)
    }
}
```

With the expressiveness of SwiftUI, our rich playback API and the set of components at your disposal you will have a full-fledged player user interface in no time.

# Compatibility

The library is suitable for applications running on iOS 16, tvOS 16 and above. The project is meant to be compiled with the latest versions of Xcode and of the Swift compiler.

# Contributing

If you want to contribute to the project have a look at our [contributing guide](docs/CONTRIBUTING.md).

# Integration

The library can be integrated using [Swift Package Manager](https://swift.org/package-manager) directly [within Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app). You can also declare the library as a dependency of another one directly in the associated `Package.swift` manifest.

A few remarks:

- When building a project integrating Pillarbox for the first time, Xcode might ask you to trust our plugins. You should accept.
- If you want your application to run on Silicon Macs as an iPad application you must add `-weak_framework MediaPlayer` to your target _Other Linker Flags_ setting.

# Getting started

To learn more about integration of Pillarbox into your project please have a look at our generated Xcode documentation.

# Documentation

Documentation is available as a [DocC](https://developer.apple.com/documentation/docc) documentation catalog. This catalog must be built by opening the project with Xcode and selecting _Product_ > _Build Documentation_. You can then access it right from within the Xcode documentation window.

Further documentation is also available by following the links below:

- [Known issues](docs/KNOWN_ISSUES.md)
- [Development setup](docs/DEVELOPMENT_SETUP.md)
- [Continuous integration](docs/CONTINUOUS_INTEGRATION.md)

# License

See the [LICENSE](LICENSE) file for more information.
