//
//  ContentView.swift
//  LiveActivityExample
//
//  Created by luke.pkg on 2023/02/21.
//

import SwiftUI

struct ContentView: View {
    let activityManager: MyActivityManager = .shared
    let locationManager: LocationManager = .shared
    
    var body: some View {
        VStack {
            Button {
                try? activityManager.start(attributes: .init(), contentState: .init(locationText: "nil"))
            } label: {
                Text("라이브 액티비티 시작")
            }
            Button {
                Task {
                    await activityManager.end()
                }
            } label: {
                Text("라이브 액티비티 종료")
            }
            Button {
                locationManager.start()
            } label: {
                Text("로케이션 매니저 시작")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
