//
//  Dex5WidgetBundle.swift
//  Dex5Widget
//
//  Created by Lori Rothermel on 1/21/25.
//

import WidgetKit
import SwiftUI

@main
struct Dex5WidgetBundle: WidgetBundle {
    var body: some Widget {
        Dex5Widget()
        Dex5WidgetControl()
        Dex5WidgetLiveActivity()
    }
}
