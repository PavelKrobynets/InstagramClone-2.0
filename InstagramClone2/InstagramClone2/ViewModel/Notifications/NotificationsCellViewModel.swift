//
//  NotificationsCellViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 14.07.2022.
//

import SwiftUI
import Firebase


class NotificationsCellViewModel: ObservableObject {
    
    @Published var notification: Notification
    init(notification: Notification){
        self.notification = notification
    }
    
    
    var timestamp : String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 2
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
}
