//
//  NotificationsView.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI

struct NotificationsView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    var body: some View {
        VStack{
        ScrollView{
            LazyVStack{
                ForEach(viewModel.notifications){ notification in
                    NotificationCell(viewModel:  NotificationsCellViewModel(notification: notification))
                }
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
