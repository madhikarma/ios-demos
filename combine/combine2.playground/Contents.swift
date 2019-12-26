import UIKit
import Foundation
import Combine

struct BlogPost {
    let title: String
    let url: URL
}

extension Notification.Name {
    static let newBlogPost = Notification.Name("new_blog_post")
}

// TOOD: is this a good / bad pattern for mobing the pub / sub code out from controller code?
struct BlogPostSubscriptionHandler {
    
    func subscribeBlogPostCreated(label: UILabel) {
        let publisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil)
        .map { (notification) -> String? in
            return (notification.object as? BlogPost)?.title ?? ""
        }

        let subscriber = Subscribers.Assign(object: label, keyPath: \.text)
        publisher.subscribe(subscriber)
    }
    
    func createBlogPost() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let blogPostURL = URL(string: "https://www.avanderlee.com/")!
            let blogPost = BlogPost(title: "Getting started with the combine framework", url: blogPostURL)
            NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
            print("Last post is: \(controller.label.text!)")
        }
    }
}

class BlogPostController {
    
    let label = UILabel()
    let handler = BlogPostSubscriptionHandler()

    func setup() {
        handler.subscribeBlogPostCreated(label: label)
    }
    
    func createBlogPost() {
        handler.createBlogPost()
    }
}



let controller = BlogPostController()
controller.setup()
controller.createBlogPost()
