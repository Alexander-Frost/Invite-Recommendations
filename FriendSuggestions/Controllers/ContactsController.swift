//
//  ContactsController.swift
//  FriendSuggestions
//
//  Created by Alex on 11/22/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import Contacts
import UIKit

class ContactsController {

    // MARK: - Properties
    
    var contactStore = CNContactStore()

    var contacts = [Contacts]() {
        didSet { // Sort Contacts
            contacts = contacts.sorted(by: { (contactA, contactB) -> Bool in
                (contactA.givenName + contactA.familyName) < (contactB.givenName + contactB.familyName)
            })
        }
    }
    
    var imageContacts = [Contacts]() 
    
    // MARK: - Init
    
    init(){
        fetchContacts { (err) in
            if let err = err {print("Error: ", err)}
        }
    }
    
    // MARK: - Methods
    
    public func fetchContacts(completion: @escaping (Error?) -> Void) {
        let key = [CNContactGivenNameKey,CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactImageDataAvailableKey, CNContactThumbnailImageDataKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        var myContacts = [Contacts]()
        var myImageContacts = [Contacts]()
        do {
            try contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
                if !contact.givenName.isEmpty && !contact.phoneNumbers.isEmpty {
                    let name = contact.givenName
                    let familyName = contact.familyName
                    let number = self.formatNum(number: contact.phoneNumbers.first?.value.stringValue ?? "No Number")
                    if number == nil {return}
                    
                    let contactToAppend: Contacts
                    
                    let myBool = name.containsEmoji || familyName.containsEmoji
                    
                    // get thumbnail image
                    if let thumbnailData = contact.thumbnailImageData, contact.imageDataAvailable || myBool {
                        let image = UIImage(data: thumbnailData)
                        contactToAppend = Contacts(givenName: name, familyName: familyName, number: number ?? "No Name", isAdded: false, timeAdded: "NA", avatar: image)
                        myImageContacts.append(contactToAppend)
                    } else {
                        contactToAppend = Contacts(givenName: name, familyName: familyName, number: number ?? "No Name", isAdded: false, timeAdded: "NA", avatar: nil)
                    }

                    myContacts.append(contactToAppend)
                }
                completion(nil)
            }
            contacts = myContacts
            imageContacts = myImageContacts
        } catch {
            NSLog("There was an error requesting contacts!")
            completion(nil)
        }
    }
    
    // Return list of contacts that have an emoji in their name
    func contactsWEmoji(contacts: [Contacts]) -> [Contacts]{
        var emojiContacts = [Contacts]()
        for cont in contacts {
            if cont.familyName.containsEmoji || cont.givenName.containsEmoji {
                emojiContacts.append(cont)
            } else {continue}
        }
        return emojiContacts
    }
    
    
    // MARK: - Helpers
    
    private func formatNum(number: String) -> String {
        let formNumber = String(number.filter { !" -()".contains($0) })
        var newNumber: String?
        if formNumber.hasPrefix("+"){
            newNumber = formNumber
        } else {
            newNumber = "+1\(formNumber)"
        }
        return newNumber ?? ""
    }
}
