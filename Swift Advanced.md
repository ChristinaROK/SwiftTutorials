# Swift Advanced

- dispatchQueue

  - keyword: thread, main thread, asyn, syn
  - url: https://www.donnywals.com/appropriately-using-dispatchqueue-main/

- state VS binding VS viewmodel

  - > If you want to observe text because you want to make some other change to your data model, then observing the change from your View is wrong. You should be observing the change from elsewhere in your model, or in a controller object, not from your View. Remember that your View is a **value** type, not a reference type. SwiftUI creates it when needed, and might store multiple copies of it, or no copies at all.

* onAppear, onChange, onReceive, onDelete
  * keyword: view modifier
* Date
  * keyword: Calendar, DateComponent, DateFormatter, Locale