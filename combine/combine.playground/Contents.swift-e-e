import UIKit
import Combine

// https://www.avanderlee.com/swift/combine/

// -- Notifications

// - Model
struct BlogPost {
    let title: String
    let url: URL
}

extension Notification.Name {
    static let newBlogPost = Notification.Name("new_blog_post")
}

// - Publisher

// create
let blogPostPublisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil)
    .map { (notification) -> String? in
        // extract (map) data from this event (notification) whenever its received by a subscriber
        return (notification.object as? BlogPost)?.title ?? ""
    }

// - Subscriber

// underlying object of subscriber
let lastPostLabel = UILabel()

// create (with what to change when the subscriber receieves events from publisher)
let lastPostLabelSubscriber = Subscribers.Assign(object: lastPostLabel, keyPath: \.text)

// - Pub <> Sub
// attach subsriber to publisher
blogPostPublisher.subscribe(lastPostLabelSubscriber)

// Create event
let blogPost = BlogPost(title: "Getting started with the Combine framework in Swift",
                        url: URL(string: "https://www.avanderlee.com/swift/combine/")!)
// Send event
NotificationCenter.default.post(name: .newBlogPost, object: blogPost)

// Output
print("Last post is: \(String(describing: lastPostLabel.text))")

// --
