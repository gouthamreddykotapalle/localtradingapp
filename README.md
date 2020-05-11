### Documentation - TheLocalTradingApp

# **Models:**

### ApplicationRecord

Direct Known Subclasses - 

* #### Post < ApplicationRecord
    
    Class for defining and generating either a buyer post or a seller post.

    - Defined in:
        app/models/post.rb
        
        Direct Known Subclasses -
        
        *    BuyPost <br>
            Class for generating a buyer post. <br><br>
            
            - Defined in: app/models/buy_post.rb

                Methods inherited from Post
                
                    all_categories, with_categories
                
                Instance Method Summary:
                
                    #price_range_are_numbers? ⇒ Boolean

        *    SellPost <br>
            Class for generating a seller post. <br><br>
            
            - Defined in: app/models/sell_post.rb
                
                Methods inherited from Post
                
                    all_categories, with_categories
        
        Class Method Summary:
        
            .all_categories ⇒ Object
            .with_categories(categories) ⇒ Object

        
* #### BuyPostDetail < ApplicationRecord
    Class that manages all the internal details and sub categories of a buyer post when using templates to create a custom buy post.

    - Defined in:
        app/models/buy_post_detail.rb

* #### SellPostDetail < ApplicationRecord
     Class that manages all the internal details and sub categories of a seller post when using templates to create a custom sell post.

    - Defined in:
        app/models/sell_post_detail.rb

* #### Template < ApplicationRecord
    Class the manages the template creation for the user that can be used to define custom posts based on the category of the post.  (both buy and sell posts). 
    
    For Example: A template for the category "car" would look something like this - 
    
        Category:  Car
        type: Buy - meaning buy post
        column ID: year
        Column Name: Year
        Data Type: string
        

    - Defined in:
        app/models/template.rb

* #### User < ApplicationRecord

    Class the manages a single user's details.

    - Defined in:
        app/models/user.rb
    
        Class Method Summary:
        
            .authenticate(email, password) ⇒ Object

# **Views:**

* buy_posts
        
    ```edit.html.haml - Page to edit a buyer post.```<br>
    ```index.html.haml - Landing page that displays all buyer posts.```<br>
    ```new.html.haml - Page to create a new Buyer Post.```<br>
    ```show.html.haml - Individual product page```

* layouts
        
    ```Application.html.haml - Root html file that manages the initialization like loading the map, fetching current location, etc```<br>
    ```mailer.html.haml```<br>
    ```mailer.text.haml```

* partials
        
    ```_footer.html.haml - Footer for all pages```<br>
   ``` _header.html.haml - Header for all pages```
        
* sell_posts
        
    ```edit.html.haml - Page to edit a seller post.```<br>
    ```index.html.haml - Landing page that displays all seller posts.```<br>
    ```new.html.haml - Page to create a new seller Post.```<br>
    ```show.html.haml - Individual product page```
        
* static_page

    ```about.html.haml - About details of developers```<br>
    ```contact.html.haml - Contact details for support```<br>
    ```home.html.haml```<br>
    ```index.html.haml```<br>
    ```privacy_policy.html.haml - Privacy policy```<br>
    ```terms.html.haml -  Terms and conditions```
        
* templates
        
    ```_detials.html.haml```<br>
    ```edit.html.haml - Editing a template```<br>
    ```index.html.haml - Listing all template```<br>
    ```new.html.haml - Creating a new template```<br>
    ```show.html.haml - Showing a particular template```
* users

    ```index.html.haml```<br>
    ```login.html.haml - Login Page```<br>
    ```new.html.haml - Register Page```<br>
    ```show.html.haml - User detials Page```

# **Controllers:**

### ApplicationController < Base

Constant Summary - 

APP_NAME = 'The Local Trading App'

Direct Known Subclasses - 

* ####  BuyPostsController < ApplicationController
    Defined in:
    - app/controllers/buy_posts_controller.rb
    
    Instance Method Summary:
    
    ```#create ⇒ Object: Creates a new buyer post```

    ```#destroy ⇒ Object: Deletes a buyer post```

    ```#detail_form ⇒ Object: Renders a detailed buy post based ona created custom template```

    ```#edit ⇒ Object: Edits a buyer post```

    ```#index ⇒ Object: Calls the before_index, sort_index and index_with_categories methods```

    ```#map_all ⇒ Object: Maps a each record in the database to the fields in the response to be later processed by the view.```

    ```#new ⇒ Object: Not used as of now```

    ```#insert_details => Object: Inserts all the details based on custom template and returns the resulting post.```

    ```#show ⇒ Object: Finds a post by ID as returns it```

    ```#update ⇒ Object: Updates a buy post```

    ```#before_index: Sets up the Column Information for GET /buy_posts.```

    ```#sort_index: sort by the key column.```

    ```#index_with_categories: sort posts by a particular category and index them.```
        
        
* ####  SellPostsController < ApplicationController
    Defined in:
    - app/controllers/sell_posts_controller.rb
    
    Instance Method Summary:
    
    ```#create ⇒ Object: Creates a new seller post```

    ```#destroy ⇒ Object: Deletes a seller post```

    ```#detail_form ⇒ Object: Renders a detailed sell post based ona created custom template```

   ```#edit ⇒ Object: Edits a sell post```

    ```#index ⇒ Object: Calls the before_index, sort_index and index_with_categories methods```

    ```#new ⇒ Object: Not used as of now```

    ```#insert_details => Object: Inserts all the details based on custom template and returns the resulting post.```

    ```#show ⇒ Object: Finds a post by ID as returns it```

    ```#update ⇒ Object: Updates a sell post```

    ```#before_index: Sets up the Column Information for GET /sell_posts```

   ```#sort_index: sort by the key column.```

    ```#index_with_categories: sort posts by a particular category and index them.```
    
* ####  SessionsController < ApplicationController
        
    Defined in:
    - app/controllers/sessions_controller.rb
    
    Instance Method Summary:
    
    ```#create ⇒ Object: Creates a user session and logs the user in.```

    ```#destroy ⇒ Object: Destroys a user Session and logs the user out.```
    
* ####  StaticPageController < ApplicationController
 
    Defined in:
    - app/controllers/static_page_controller.rb
    
    Instance Method Summary:
    
        #about ⇒ Object: <Not Used as of now>
        #contact ⇒ Object: <Not Used as of now>
        #home ⇒ Object: <Not Used as of now>
        #index ⇒ Object: <Not Used as of now>
        #privacypolicy ⇒ Object: <Not Used as of now>
        #terms ⇒ Object: <Not Used as of now>
        
* ####  TemplatesController < ApplicationController

    Defined in:
    - app/controllers/templates_controller.rb
    
    Instance Method Summary:
    
    ```#create ⇒ Object: Creates a new template```

    ```#destroy ⇒ Object: Deletes a template```

    ```#edit ⇒ Object: Edits a tempalate```

    ```#index ⇒ Object: Lists all templates```

    ```#new ⇒ Object:```

    ```#show ⇒ Object: Searches for a template```

    ```#update ⇒ Object: Updates a template```
    
* ####  UsersController < ApplicationController

    Defined in:
    - app/controllers/users_controller.rb
    
    Instance Method Summary:
    
    ```#create ⇒ Object: Handles Registration```

    ```#index ⇒ Object: Users list is not supposed to explore by ordinary users. It should always redirect back to home page until we develop Admin role.```

    ```#login ⇒ Object: Handles user login```

    ```#new ⇒ Object```

    ```#show ⇒ Object: Retrieves user details from model and redirects to user page.```


