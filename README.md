# Cocktails

## Structure
    
    Cocktails # Target
    |
    ├── Supporting              # Supporting Files
    │   ├── Assets              # Image Assets
    │   └── Constants           # Constants hardcoded
    |
    ├── Application              # Application Core
    │   └── CocktailsApp         # Main App Entry Point
    |
    ├── Common                  # Shared Components
    │   ├── Navigation          # Navigation
    │   │   ├── Route               # Defines navigation routes for the application.
    │   │   └── NavigationRouter    # Manages the navigation stack of routes.
    │   ├── Managers             # Managers and helpers
    │   │   └── TimeFormatterManager # Manager for formatting date
    │   ├── Views                # Reusable Views
    │   │   ├── EmptyDrinkView          # Empty state view
    │   │   ├── CustomNavigationView    # Custom Navigation bar
    │   │   ├── DrinkDividerView        # Custom Divider view
    │   │   └── DrinkMainButton         # Main Button view
    │   ├── Extensions           # Helper Extensions
    │   │   └── ImageExtension      # Image utilities
    │   └── Networking           # Networking Layer
    │       ├── SessionManager
    │       │   └── CocktailsSessionManager    # Manages Session config for Alamofire
    │       ├── Support
    │       │   ├── ReactiveDataRequest    # Extends DataRequest from Alamofire to support RxSwift
    │       │   └── DynamicCodingKeys      # Custom coding key
    │       ├── Service
    │       │   ├── Service                # Singleton class to manage network requests
    │       │   └── CocktailsService       # Cocktails service that implements DrinksServiceProtocol and uses Service to perform network requests
    │       ├── Router
    │       │   ├── Router               # Configuring and constructing URL requests with paths, methods, headers and params
    │       │   ├── EncodableParams      # Encoding parameters into URL requests
    │       │   └── CocktailsRouter      # Specific routes for Cocktails API endpoints
    │       └── Models
    │           ├── Drink                # Drink model with decoding logic
    │           ├── FilterItems          # Category, Glass and Alcoholic models
    │           └── FilterType           # Filter type for sending parameters when filtering
    |
    └── Modules                 # Feature Modules
        ├── Root            # Root View
        ├── Filters         # Filters Module
        ├── DrinkDetails    # Drink Details Module
        └── DrinkList       # Drink List Module

## Dependencies

- [Alamofire](https://github.com/Alamofire/Alamofire) - Alamofire is an HTTP networking library written in Swift.
- [RxSwift](https://github.com/ReactiveX/RxSwift) - RxSwift is a reactive programming library for iOS development.
- [Kingfisher](https://github.com/onevcat/Kingfisher) - Kingfisher is a library for downloading and caching images from the web.
