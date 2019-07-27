//
//  UNNotificationManager.swift
//  LocalNotification
//
//  Created by Wi on 29/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit
import UserNotifications

final class UNNotificationManager: NSObject{
    struct Identifier {
        static let basicCategory = "BasicCategory"
        static let anotherCategory = "AnotherCategory"
        
        static let timeIntervalRequest = "TimeIntervalRequest"
        static let calendarRequest = "CanlendarRequest"
        
        static let repeatAction = "RepeatAction"
        static let removeAction = "RemoveAction"
        static let textInputAction = "TextInputAction"
    }
    func register(){
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert,.badge,.sound]
        center.delegate = self
        center.requestAuthorization(options: options) { (isGranted, error) in
            guard isGranted else{ // 권한이 있는지 체크
                print(error?.localizedDescription ?? "")
                return
            }
            self.setupNotifivationCategories()
//            UIApplication.shared.registerForRemoteNotifications()
        }
        
    }
    
    func alertNotivicationIsNotGranted(){
        guard let settingUrl = URL(string: UIApplication.openSettingsURLString
            ) else {return}
        DispatchQueue.main.async {
            UIApplication.shared.open(settingUrl)
        }
    }
    func getNotificationSettings(with completionHandeler: @escaping (Bool) -> Void){
        UNUserNotificationCenter.current().getNotificationSettings {
            completionHandeler($0.authorizationStatus == .authorized)
        }
    }
    func setupNotifivationCategories(){
        let basicCategory = UNNotificationCategory(identifier: Identifier.basicCategory, actions: [], intentIdentifiers: [])
//        TimeIntervalNotification 시간마다 반복
//        CalenderNotificaion 날짜 마다
//        LocationNotification  특정 장소
        
        let repeatAction = UNNotificationAction(identifier: Identifier.repeatAction, title: "Repeat", options: [.destructive, . foreground])
        let removeAction = UNNotificationAction(identifier: Identifier.removeAction, title: "Remove", options: [])
        let textInputAction = UNTextInputNotificationAction(identifier: Identifier.textInputAction, title: "Change Title", options: [.authenticationRequired], textInputButtonTitle: "Save", textInputPlaceholder: "Repeat with Input Message")
        let anotherCategory = UNNotificationCategory(identifier: Identifier.anotherCategory, actions: [repeatAction,removeAction,textInputAction], intentIdentifiers: [], options: [.customDismissAction])
        UNUserNotificationCenter.current().setNotificationCategories([basicCategory,anotherCategory])
    }
    func triggerTimeIntervalNotification(withTitle title: String = "Reminder"){
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = Identifier.basicCategory
//        content.title = "ABC"
        content.title = NSString.localizedUserNotificationString(forKey: title, arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Alarm fired", arguments: nil)
        content.badge = 40400
        // 사운드 미설정시 소리 x
//        content.sound = UNNotificationSound.default
        let soundName = UNNotificationSoundName(rawValue: "sweetalertsound4.wav")
        content.sound = UNNotificationSound(named: soundName)
        
        //오디오 (5MB), 이미지 (10MB), Movie(50MB)
        if let  imageURL = Bundle.main.url(forResource: "movieImage", withExtension: "jpg"){
            let attachment = try! UNNotificationAttachment(identifier: "MovieImage", url: imageURL)
            content.attachments = [attachment]
        }
        
        //true 일때는 60초 이상
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        let request = UNNotificationRequest(identifier: Identifier.timeIntervalRequest, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func triggerCalinderNotification(withTitle title: String = "Reminder"){
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = Identifier.anotherCategory
        content.title =  NSString.localizedUserNotificationString(forKey: title, arguments: nil)
        content.subtitle = "SubTitle"
        content.body = "Body"
        content.sound = UNNotificationSound.default
        content.userInfo = ["Name": "Wi"]
        
        if let soundURL = Bundle.main.url(forResource: "pup-alert", withExtension: "mp3"){
            let soundAttachment = try! UNNotificationAttachment(identifier: "SoundAttachment", url: soundURL)
            content.attachments = [soundAttachment]
        }
        
        let calender = Calendar.current
        let date = Date(timeIntervalSinceNow: 5)
        var dateComponents = DateComponents()
        dateComponents.calendar = calender
        dateComponents.hour = calender.component(.hour, from: date)
        dateComponents.minute = calender.component(.minute, from: date)
        dateComponents.second = calender.component(.second, from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: Identifier.calendarRequest, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        
    }
    
    func removeNotificationRequest(withIdentifier indentifire: String){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [indentifire])
    }
}

extension UNNotificationManager: UNUserNotificationCenterDelegate{
    // foreground 상태에서 받았을때 // 앱이 떠있을때
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("notification:", notification)
        completionHandler([.alert, .sound])
    }
    // forground 가 아닐때 바탕화면에 있을때
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("notification")
        let content = response.notification.request.content
        let userInfo = content.userInfo
        let categoryID = content.categoryIdentifier
        
        
        if categoryID == Identifier.anotherCategory{
            switch response.actionIdentifier {
            case UNNotificationDismissActionIdentifier:
                print("Dismiss Notification")
            case UNNotificationDefaultActionIdentifier:
                print("Tap Notification")
            case Identifier.repeatAction:
                print("Repeat Action")
                triggerCalinderNotification()
            case Identifier.removeAction:
                print("Remove Action")
            // Remove Some Data
            case Identifier.textInputAction:
                print("TextInputAction")
                if let inputResponse = response as? UNTextInputNotificationResponse {
                    triggerTimeIntervalNotification(withTitle: inputResponse.userText)
                }
            default:
                print("Unknown action")
            }
        }else{
            print("basic Category")
        }
        completionHandler()
    }
    
}
