import ActivityKit

class MyActivityManager {
    static let shared: MyActivityManager = .init()
    
    typealias Attributes = MyWidgetExtensionAttributes
    typealias ContentState = Attributes.ContentState
    
    private var activity: Activity<Attributes>?
    
    private init() {
        activity = Activity<Attributes>.activities.first
    }
    
    func start(attributes: Attributes, contentState: ContentState) throws {
        guard activity == nil else {
            return
        }
        activity = try .request(attributes: attributes, contentState: contentState)
    }
    
    func update(contentState: ContentState) async {
        await activity?.update(using: contentState)
    }
    
    func end(contentState: ContentState? = nil) async {
        await activity?.end(using: contentState)
        activity = nil
    }
}
