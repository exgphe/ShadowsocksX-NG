//
//  PreferencesView.swift
//  ShadowsocksX-NG
//
//  Created by Xiaolin Wang on 2021/7/2.
//  Copyright © 2021 exgphe. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        Form {
            TextField("Username", text: .constant(""))
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
