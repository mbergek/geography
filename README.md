# Geography

This is a sample project to explore some SwiftUI concepts.

## Topics

### How to populate previews with mockup data?

Most examples, as well as the Apple template, use a flat data model where a list is populated with data persisted by Core Data, especially in relation to navigation views. This is pretty self-explanatory and example data being defined in Persistence.swift means that it is kept out of the view files.

It is less clear how data should be provided for the previews in any child view and there are very few examples of this when searching in the obvious channels. It seems to be the recommendation that the objects are passed through the navigation link to the child view where they can then be listed. And this works without any issues (apart from the fact that the one-to-many relationships come out as NSSet which needs to be turned into an array to be listed in the child view). But the preview is a different matter, the only sources seem to imply that the preview data should be defined in the preview. But this does not appear DRY and would lead to a lot of repetition in projects with many views. I would rather keep the views free of such data.

**Keywords**: SwiftUI, Core Data, NavigationView, NavigationLink, preview
