//
//  ImportView.swift
//  ShadowsocksX-NG
//
//  Created by Xiaolin Wang on 2021/7/2.
//  Copyright © 2021 exgphe. All rights reserved.
//

import SwiftUI

struct ImportView: View {
    @State var content = ""
    var body: some View {
        VStack(alignment: .trailing) {
            VStack(alignment: .leading) {
                Text("Copy the shadowsocks URLs to here")
                TextEditor(text: $content)
            }
            Button {
                
            } label: {
                Text("Import")
            }
        }
    }
}

struct ImportView_Previews: PreviewProvider {
    static var previews: some View {
        ImportView()
    }
}
