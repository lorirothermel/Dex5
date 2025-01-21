//
//  Dex5WidgetLiveActivity.swift
//  Dex5Widget
//
//  Created by Lori Rothermel on 1/21/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Dex5WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Dex5WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Dex5WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Dex5WidgetAttributes {
    fileprivate static var preview: Dex5WidgetAttributes {
        Dex5WidgetAttributes(name: "World")
    }
}

extension Dex5WidgetAttributes.ContentState {
    fileprivate static var smiley: Dex5WidgetAttributes.ContentState {
        Dex5WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Dex5WidgetAttributes.ContentState {
         Dex5WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Dex5WidgetAttributes.preview) {
   Dex5WidgetLiveActivity()
} contentStates: {
    Dex5WidgetAttributes.ContentState.smiley
    Dex5WidgetAttributes.ContentState.starEyes
}
