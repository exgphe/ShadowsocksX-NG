//
//  ShareServerProfilesView.swift
//  ShadowsocksX-NG
//
//  Created by Xiaolin Wang on 2021/7/2.
//  Copyright © 2021 exgphe. All rights reserved.
//

import SwiftUI

struct ShareServerProfilesView: View {
    var body: some View {
        LazyHGrid(rows: [GridItem(.flexible(minimum: 0, maximum: .infinity), alignment: .topLeading), GridItem(.flexible(minimum: 0, maximum: .infinity), alignment: .topLeading)],alignment: .top, spacing: 20) {
            List {
                Text("Vultr Tokyo")
                Text("Vultr Tokyo 6")
            }.frame(maxWidth: .infinity)
            VStack {
                Button {
                    
                } label: {
                    Text("Copy All Server URLs").frame(maxWidth: .infinity)
                }
                Button {
                    
                } label: {
                    Text("Save All Server URLs As File").frame(maxWidth: .infinity)
                }
            }.frame(maxWidth: .infinity)
            VStack {
                Text("The QRCode is in SIP002 format")
                Image(systemName: "pencil").frame(maxHeight:.infinity)
            }.frame(maxWidth: .infinity)
            VStack {
                Button {
                    
                } label: {
                    Text("Copy All Server URLs").frame(maxWidth: .infinity)
                }
                Button {
                    
                } label: {
                    Text("Copy All Server URLs").frame(maxWidth: .infinity)
                }
                Button {
                    
                } label: {
                    Text("Copy All Server URLs").frame(maxWidth: .infinity)
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

struct ShareServerProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        ShareServerProfilesView()
    }
}
