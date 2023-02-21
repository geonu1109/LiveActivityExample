//
//  MyWidgetExtensionAttributes.swift
//  LiveActivityExample
//
//  Created by luke.pkg on 2023/02/21.
//

import ActivityKit

struct MyWidgetExtensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var unixTimeText: String?
        var locationText: String
    }
}
