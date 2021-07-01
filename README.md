# NASAImages

The NASAImages project was build using MVVM architecture
The Image Model containts the NASA Image struct with codables to map json from the API with it.
The API Service is housing the URLSession and map data into CollectionData struct.
The ViewModel is housing the RxSwift loading logic and pass it to the view controller populate the table view


KnownBugs:
On the ImageViewModel, the rxSwift items failed to be bind items into the viewModel: 
Instance member 'items' cannot be used on type 'ImagesViewModel'
