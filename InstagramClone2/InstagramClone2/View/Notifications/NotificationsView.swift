//
//  NotificationsView.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0..<10){_ in
                    NotificationCell()
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
