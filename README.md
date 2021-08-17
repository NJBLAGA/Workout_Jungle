# **Workout Jungle**

### **Workout Jungle URL: https://workout-jungle.herokuapp.com**

### **Workout Jungle GitHub Repository: https://github.com/NJBLAGA/workout_jungle**

### **T2A2 Readme GitHub Repository: https://github.com/NJBLAGA/NathanBlaga_T2A2**

### **Installation:**

***NOTE:*** Workout Jungle was developed and tested on a ```Linux system (Ubuntu)```, no testing was undertaken on ```Mac``` or ```Windows``` OS.

#### **Getting started**

Follow the above link to Workout Jungle's GitHub Repo.

Once there, clone it down to your local machine.

Once installed, open the project in any text editor and navigate to the Gemfile.

By default the project will be running ```ruby version 2.7.2``` and ```rails version 6.0.3.5```, as shown below:

![Workout Jungle Wireframes - Home Page](./docs/img/gem_file_1.png)

It is recommended that this project is run with rails version 6 +.

However if you wish to run the project with a different ruby or rails version, simply change the version number in this file, save and close. Likewise, if you wish to add any new gems to the project, add them in this file.

Once done, navigate to your terminal and run the following lines:

```r
# Installs node modules used through Webpack for bootstrap JS such as tooltips and navbar functionality.
yarn add bootstrap jquery popper.js
# Ensures all dependencies in Gemfile are available for Workout Jungle
bundle install
#Install packages and project dependencies
yarn install --check-files
```

***NOTE:*** JS config files for bootstrap should already be set up out of the box, however if anything is missing or not working correctly, follow the below guide for setting up bootstrap JS for rails 6:

**https://gorails.com/episodes/how-to-use-bootstrap-with-webpack-and-rails**

#### **Setting up the Database**

Once the previous steps have been completed, it is time to set up your database. Navigate to your terminal and run the following line:

```r
# Creates a database for project
rails db:create
```

Once the database has been created, run the following line:

```r
# Runs migrations for the current environment that has not yet been run.
rails db:migrate
```

An optional step is to populate the database with pre made admins, users and listings, using the ```seeds.rb``` file. To do so, run the following command:

```r
# Seeds your database with pre made admins, users and listings.
rails db:seed
```

Once successfully completed, Workout Jungle's database should be established and seeded, ready to run.

#### **Active Storage/Cloudinary**

***NOTE:*** If you wish to run another service such as AWS rather than Cloudinary, feel free to do so, however out of the box Workout Jungle is already setup to utilise Cloudinary and active storage.  

To set up this feature, open the project in a text editor. Once open, navigate to the ```config``` folder and delete the file named ```credentials.yml.enc```

Now you can create your own by typing the following command in your terminal:

```r
EDITOR="code --wait" rails credentials:edit
```

This will open up a new credentials file, input the following:

```r
cloudinary: 
  service: Cloudinary
  cloud_name: xxxxxxxxxxx
  api_key: xxxxxxxxxxxxxxxxx
  api_secret: xxxxxxxxxxxxxxxxxx
```

***NOTE:*** You can find your ```cloud_name```, ```api_key``` and ```api_secret``` on your cloudinary dashboard. If you do not have an account, create one here:

**http://www.cloudinary.com**

Once you have signed up (it is for free), you will be directed to your dashboard.

Once you have entered your credentials in the same way shown above, save and close the file. The following will be displayed:

```r
File encrypted and saved.
```

Now navigate to the file named ```storage.yml``` in the ```config``` folder and confirm the following lines of code are present:

```r
cloudinary:
  service: Cloudinary
  cloud_name: <%= Rails.application.credentials.dig(:cloudinary, :cloud_name) %>
  api_key: <%= Rails.application.credentials.dig(:cloudinary, :api_key) %>
  api_secret: <%= Rails.application.credentials.dig(:cloudinary, :api_secret) %>
```

Last step is to navigate to the ```environments``` folder within the ```config``` folder of your project. There you will see two files named; ```development.rb``` and ```production.rb```

Out of the box, both are configured to store uploaded files on cloudinary rather than locally. ***(No action is needed unless you wish to have files stored locally.)***

All configuration needed to run Workout Jungle alongside Cloudinary should now be completed and ready to run.

In your terminal line, type the following:

```r
#Runs rails server on port 3000(default)
rails s
```

Open a new browser, and type the following: ```localhost:3000```.

If successful, you should see the following:

![Workout Jungle Screenshot](./docs/img/sc_home_page.png)

Log In(seeded usernames and passwords can be found in the ```seeds.rb``` file within the ```db``` folder of the project) or Sign Up with a new account.

Enjoy!

### **Tech Stack:**

#### **Application:**

- Ruby v- 2.7.2
- Rails v- 6.0.3.5

#### **Sever:**

- Puma

#### **Gems:**

- Devise
- Simple_form
- Jquery-rails
- Cloudinary
- Activestorage-cloudinary-service
- kramdown

#### **CSS Framework:**

- Bootstrap

#### **Database:**

- PostgreSQL

#### **Cloud Storage:**

- Cloudinary

#### **Deployment:**

- Heroku

#### **DevOps:**

- GitHub
- Trello

### **Background/Problem:**

The global pandemic of COVID-19 spread around the world in 2020 and continues to do so to this day. The virus has had a dramatic and destructive influence over the world economy, resulting in various industries undergoing drastic change. One impacted industry was that of home fitness equipment. With multiple lockdowns occurring worldwide, commercial gyms were shutdown resulting in millions of people working out daily in their homes, backyards and various small local parks.  "ANZ Research economist Adelaide Timbrell told The New Daily sales of home gym equipment spiked after commercial gyms were closed by government" (Plastow 2020). "The initial surge petered out before the end of March, but Ms Timbrell said the decline in sales was caused more by a lack of supply than a lack of demand. Home exercise equipment is a niche market – most people generally join gyms instead, so supply chain issues were exacerbated by COVID-19 a lot more than other more mainstream products,” she said" (Reid 2020). Many experts believe that with a possible end to covid in the next few years, the industry still might see an influx of demand for home gym equipment over returning to commercial gym (Lufkin 2020).

### **Importance:**

Studies have shown that exercise is a vital key in combating stress, dealing with depression and anxiety disorders. Due to the nature of the lockdowns, a number of people who suffered from anxiety and depression from being alone had a difficult time dealing with the present situation. Australians did not have access to a personal home gym or fitness equipment. This meant for months, some Australians went without any form of exercise resulting in no real form of releasing tension and decreasing growing levels of stress and anxiety. Beyond the COVID-19 era, people stemming from low level households could not support a gym membership or invest into a state of the art home gym. This is why it is important that online marketplaces such as Workout Jungle exist and continue to help pair buyers and sellers of new and used fitness equipment.

### **Purpose:**

The original intention of Workout Jungle was to provide a marketplace in which Australian consumers could buy and sell new and used fitness equipment. While there are already various competing sites such as; graysfitness.com.au and gymsolutions.com.au, COVID-19 created an ongoing demand for Australian consumers to continue exercising at home. Whether the demand is due to social media fads or maintaining a healthy lifestyle (physically or mentally), COVID-19 has forced consumers to invest more into their home gyms. Workout Jungle has a primary goal on bringing buyers and sellers together in a safe, protected and user-friendly space. As of launch, Workout Jungle's various features allow the site to achieve these goals, with planned feature updates scheduled to roll out over the next year to not only improve the user experience, but ultimately become the top Australian fitness gym marketplace.

### **Target Audience:**

The site's primary goal is to provide a marketplace for buyers and sellers throughout the COVID-19 pandemic. These buyers and sellers range from everyday Australian consumers, athletes and even commercial gyms. However the focus is to think beyond COVID-19 and expand to various focus groups such as;

- Stay at home parents
- Consumers living in remote areas of the country
- Consumers living in low income areas
- Professional and amateur bodybuilders/powerlifters
- Personal trainers
- Small gyms and fitness centres

### **User Stories & Proposed Solutions:**

- As a user, I want assurance of my accounts privacy and safety.

**Solution:** Utilising the Devise gem, Workout Jungle will have an authentication structure for all users and admins. It will also allow the site to restrict users on certain areas and features.

- As a user, I want to be able to buy or sell fitness equipment.

**Solution:** Through Ruby on Rails using a MVC framework, the site will draw upon CRUD functionality to allow users to Create, Read, Update and Delete listings of different fitness equipment.

- As a seller, I want to be able to upload an image and relevant information about my listings.

**Solution:** Through CRUD actions mentioned above, the user will be able to post and edit their listings. Additionally, by utilising PostgreSQL, the site can store saved data and images pertaining to different listings. Finally, in conjunction with a cloud based storage service such as Cloudinary, Workout Jungle can store the relevant images without worrying about local server space.

- A a seller, I only want signed-in users of the site to be able to view my listings and message me.

**Solution:** Through Devise helpers such as ```authenticate_user!``` and placing restrictions throughout the source code, only signed in users may access Workout Jungle.

- As a user, I want to be able to contact sellers to discuss settlement and payment of listings.

**Solution:** Developing and integrating a messaging system in which users can freely message one another to negotiate prices, delivery details and payment.

- As a user, I want to be able to store my favourite listings under one space.

**Solution:** Developing and integrating a cart or wish list feature that allows users to add listings to a "bucket". Users can then access that bucket with ease to either purchase or remove the listing.

- As an admin, I want to be able to uphold Workout Jungle's integrity towards its users by having the scope to not only view all listings, but delete them if they are found to be in violation of the terms and conditions.

**Solution:** While on the all listings page, a "delete" feature will be present for admins only, allowing them to remove any listings found to be of bad taste or false nature.

- As an admin, I want the ability to delete users if they are found violating the terms and conditions.

**Solution:** Create an admin dashboard in which admin can view all current users. This page will only be accessible to admin, and will provide a feature in which they may delete users if said user is found violating the terms and conditions.

- As an admin, I want the ability to assign the role of admin to users who wish to help grow the community and the site's scalability.

**Solution:** Create an admin dashboard in which admin can view all current users. This page will only be accessible to admin, and will provide a feature in which they may assign the role of admin to said user.

- As a user, I want a user-friendly interface that can function on desktop, tablet and mobile devices with a simplistic design and responsive navigational layout.

**Solution:** Use Bootstrap framework to build a responsive and simplistic desgin, including a fully functional navbar that transcends to all devices.

### **Trello**

The tasks and features comprised of Workout Jungle's development were allocated and tracked through the below trello board. Following an agile methodology, each feature of the application was developed over multiple sprints. Each sprint/feature was allocated a time frame for development, testing, integration and deployment.

#### **Workout Jungle Trello board: https://trello.com/b/KgPASnGD/workout-jungle**

![Workout Jungle Trello](./docs/img/trello_workout_jungle.png)

The Tasks Completed column houses tasks that focus on research and planning. The majority of these tasks were completed before any code was written. Below is a brief description of the key tasks:

**Research fitness equipment sites:**

It was important to understand the landscape of the market and where it was positioned in regards to pre and post COVID-19. Research into other applications was needed to better understand what consumers expect and need for such application.

**Design sitemap:**

The sitemap was designed with the user stories in mind, a simplistic and user-friendly site with a strong navigational layout.

**Design wireframes:**

The wireframes were also designed with the user stories in mind. It was always the intention to use Bootstrap as the styling framework for this project. Other frameworks such as Bulma and tailwind were considered and even tested, however did not make it to the final product.

**Design ERD:**

The ERD was required to have a better understanding of how the database and its relations would interact within the application, and therefore more time was allocated to this task.

The remaining features columns were used to house the development, testing, integration and deployment of the key features of Workout Jungle.

Below is a brief description of the key features:

**User Model:**

Setting up user authentication and profile management through devise was key in establishing the framework for the following models. Significant time was allocated to this feature.

**Admin Model:**

Created through devise, this model acts as an extension of the user model and is the foundation for the entire admin role for the app. Significant time was also allocated to this feature.

**Listings Model:**

The listing model is seen as the key feature of the entire app and was therefore spilt into several sprints for wide variety of functionality throughout the site. Sprints were created for;

- All listings page
- Your listings page (changed to My listings page)
- Post new listing page
- Show listing page

**Active Storage & Cloudinary:**

The main focus of this sprint was to have images attached to listings being stored on a cloud sever (Cloudinary) rather than being stored locally. It was vital to the development of Workout Jungle to provide efficient and effective storage capabilities. Significant time was also allocated to this feature.

**Shopping Cart:**

It was important to meet user stories and so a shopping cart was developed for the application, allowing users to save their favourite listings until a settlement could be arranged with the seller. It should be noted that through development, due to no real payment option being available, the name of the feature was changed on the front end of the code to "Wish List". A major portion of time (2.5 days) was also allocated to this feature.

**Message System:**

Due to the nature of the application(heavily borrowed from gumtree), it was important to develop a messaging system in which buyers and sellers could exchange information, settlement on price, negotiating arrangements, delivery and payment options etc. A major portion of time (3 days) was also allocated to this feature.

**Admin Dashboard:**

Building upon the admin model, Workout Jungle needed an admin only accessible page in which users could be deleted or assigned to the role of admin. Considerable time was given to making sure this page was functioning correctly and was completely unreachable by average users.

**Navbar/styling:**

The navbar and overall styling was implemented towards the end of the application's development cycle. The sprint was focused on building a nav-bar through bootstrap that satisfied the user stories, while the layout and design of the site was focused on having a simplistic and yet functional layout on mobile, desktop and tablet devices.

### **Sitemap**

![Workout Jungle Sitemap](./docs/img/workout_jungle_sitemap.png)

The initial sitemap developed and designed for Workout Jungle held its basic structure all throughout development. As shown above, when a customer lands on the home page (Jungle), they must log in or sign up to have access to the site. Throughout development, the check point for the user needing to be signed in varied. However after extensive testing, it was decided to place the sign in feature on the home page and lock the rest of the site out to any non-signed in users. This was due to fulfilling the requirements of the user stories and more importantly to support the structure of the application. Overall, it provided a more user-friendly and smooth experience while upholding user's privacy and safety. An additional layer was added where if a user is signed in and has the role of an admin, they would have access to an optional link; the admin dashboard. This ensured that an average user could not access this admin dashboard and abuse the features of deleting or assigning admin roles. The final version of Workout Jungle was suffering from navbar bugs in which the profile link was not allowing users/admins to access the three options. This resulted in a new navbar layout in which the Admin Dashboard, Edit Profile and Log Out links were placed on the same layer as the other links.

### **Wireframes:**

The initial wireframes designed and developed for Workout Jungle maintained their basic structure and layout throughout the development and production cycles. However, a few key elements were either removed, modified or completely revamped for the final product. Below is a breakdown of all wireframes and any changes that occurred. It should be noted that from these initial designs to the final product, Workout Jungle maintained a Mobile first design and will look to the future to continuously improve its design.

**Home Page:**

The home page had little to no changes throughout development. All three designs maintained their structure and layout features leading to the final product.

![Workout Jungle Wireframes - Home Page](./docs/img/wf_home_page.png)

**Navbar:**

The navbar had several changes, although the wireframes showed a burger element in all three views. Throughout the styling sprint, several changes were made to a more 'traditional' style. However it was finally settled upon to have a mobile styled navbar for all three views. The links also changed as Your Listings became My Listings, Cart became Wish List, Messages became Inbox and Admin changed to Admin Dashboard.

![Workout Jungle Wireframes - Nav Bar](./docs/img/wf_nav_bar.png)

**Sign Up Page:**

There was little to no change in the sign up form page throughout development. It maintained a basic and simple sign up style and structure.

![Workout Jungle Wireframes - Sign Up Page](./docs/img/wf_sign_up_page.png)

**Sign In Page:**

Likewise, the Sign In Page did not change at all and kept its structure.

![Workout Jungle Wireframes - Sign In Page](./docs/img/wf_sign_in_page.png)

**Edit Profile Page:**

The Edit Profile/Change Password saw some changes throughout its sprint, mostly wording and design elements but nothing too drastic. It is a key page that will be revisited in the future for minor changes. Plans are to allow the user more customisation of their profile, an avatar, bio and a toggle message on/off feature.

![Workout Jungle Wireframes - Edit Profile Page](./docs/img/wf_edit_profile_page.png)

**Post New Listings:**

Other than a name change, this page only saw a design change slightly and nothing too drastic.

![Workout Jungle Wireframes - New Listings Page](./docs/img/wf_new_listings_page.png)

**All Listings Page:**

This page saw major changes throughout its sprint. First of all, it has two views - one for a user and one for an admin. As a user on this page, they can only see and click on the show button, while an admin can access the delete button function. The basic structure of the cards that house the listings saw changes throughout the styling sprint and were close to the initial design with only small changes to their functionality.

![Workout Jungle Wireframes - All Listings Page](./docs/img/wf_all_listings_page.png)

**My Listings Page:**

My Listings Page saw minor changes to its structure and overall design. There was a stage during the sprint that the filter bar was removed from the page, yet brought back to allow the user to have more sorting functionality on the page.

![Workout Jungle Wireframes - Your Listings Page](./docs/img/wf_your_listings_page.png)

**Show Listings Page:**

As shown on the wireframes, the user would have multiple images attached and displayed on this page, however this was later changed to one image instead. Future plans include allowing users to upload and view multiple images for each listing.

![Workout Jungle Wireframes - Show Listing Page](./docs/img/wf_show_listing_page.png)

**Wish List Page:**

Originally Shopping cart or Cart, the change to Wish List better suited the style and flow of the site as a whole. A user can add their favourite listings to a list in which they could access very easily until a settlement can be reached with the seller. The design went through several changes until it reached the final products design (which aligns closely to that of the wireframes).

![Workout Jungle Wireframes - Cart Page](./docs/img/wf_cart_page.png)

**Inbox Page:**

Inbox design went through several iterations before settling on the final design which fits closely to the original design and act as a user-friendly interface for users to engage in conversations with other users.

![Workout Jungle Wireframes - Conversations Page](./docs/img/wf_conversations_page.png)

**Message Page:**

The message page saw some changes but was reverted back to the original design due to time constraints. Future updates will be implemented to refine its interface including the use of a notification system.

![Workout Jungle Wireframes - Message Page](./docs/img/wf_message_page.png)

**Admin Dashboard Page:**

The Admin Dashboard saw changes in its button layout throughout the different devices, however kept true to its original design and layout. Future updates of this page will include a private messaging system between admins, the introduction of a moderator role and more security checks.

![Workout Jungle Wireframes - Admin Page](./docs/img/wf_admin_page.png)

### **Functionality/features:**

Workout Jungle's features and functionality stem from the need to meet user requirements defined above in user stories. Individually, each feature has a core function. In unison, they provide a user-friendly space in which users can buy and sell fitness equipment in a safe and friendly environment.

#### **Home Page:**

The home page provides all users with the terms and conditions in which they must abide with. It also blocks non-signed in users access to the rest of the site and requires all users to be signed in with an account to proceed.

![Workout Jungle Screenshot](./docs/img/sc_home_page.png)
![Workout Jungle Screenshot](./docs/img/sc_home_page_2.png)

#### **Listings System:**

The listing system allows the core function of the site to be fulfilled; the ability to post and view fitness equipment for sale.

A user can access the Post New Listing Page to quickly and easily post a new listing. Predefined selections for condition and listing type allows Workout Jungle to have some control over the listings being posted. Validations on the back end are also in place to prevent too little or too much information being provided.

![Workout Jungle Screenshot](./docs/img/sc_new_listing.png)

All Listings Page allows users to view all listings on the site and in the Show Page. As mentioned above, this page has a admin feature in which they have access to a delete function for each listing (if said listing violates the terms and conditions).

![Workout Jungle Screenshot](./docs/img/sc_all_listings.png)

![Workout Jungle Screenshot](./docs/img/sc_all_listings_mobile.png)

My Listings Page allows users to view, edit or delete their own listings. If a user tries to access listings that do not belong to them, they will be redirected and alerted that that was not for them to view.

![Workout Jungle Screenshot](./docs/img/sc_my_listings.png)

![Workout Jungle Screenshot](./docs/img/sc_my_listings_mobile.png)

The Show Page allows users to have a closer look at the listings themselves. This page allows a user to either add said listing to their wish list, message the seller directly or return to the All Listings Page.

![Workout Jungle Screenshot](./docs/img/sc_show_page.png)

![Workout Jungle Screenshot](./docs/img/sc_show_page_mobile.png)

#### **User System:**

The user system was created through devise. Users currently can sign up, sign in and edit their profile.

The Sign Up Page contains a basic form in which a user can assign a username, an email and password to their account. Built with simple_forms, it consists of a basic layout and design that is safe and user-friendly.

![Workout Jungle Screenshot](./docs/img/sc_sign_up.png)

The Sign In Page twins the Sign Up Page in its simplistic nature and was developed through the combination of devise, simle_forms and bootstrap.

![Workout Jungle Screenshot](./docs/img/sc_log_in_mobile.png)

The user system has an Edit Profile Page in which users can freely change their password for any reason. There is no limit or lockout period currently for this feature.

![Workout Jungle Screenshot](./docs/img/sc_edit_profile.png)

#### **Admin System:**

The Admin system was developed through devise as an extension of the user system. Its main function is to provide some form of authority throughout the application. Currently, an admin can only be created by seeding them in by the ```rails db:seed``` command or if an established admin assigns it through the admin Dashboard.

The admin dashboard displays all current users and admins of Workout Jungle. It also provides two main functions next to each username - assign admin and delete user. An admin has the power to promote another user (if trusted and reliable) to have the role of admin. An admin can also delete any user who violates the terms and conditions listed on the home page.

![Workout Jungle Screenshot](./docs/img/sc_admin.png)

Another feature of an admin is shown on the All Listings page, as demonstrated below and explained throughout this document.

The difference between a user and an admin viewing this page is clearly displayed below. 
![Workout Jungle Screenshot](./docs/img/sc_all_listings.png)

![Workout Jungle Screenshot](./docs/img/sc_user_admin.png)

#### **Responsive Navbar:**

The Navbar was created using Bootstrap and was designed to have a responsive feel and abide by the applications mobile first design architecture. It allows the user to have a smooth manner in which to navigate throughout Workout Jungle's various pages. It shares the same design across all devices and does not negatively impose on the remaining elements of the site.

![Workout Jungle Screenshot](./docs/img/sc_nav_desktop.png)
![Workout Jungle Screenshot](./docs/img/sc_navbar_mobile.png)

#### **Filter System:**

The filter system allows users on both the All Listings and My Listings pages to view certain listings depending on the listing type. It allows the user to save time searching and scrolling through hundreds of listings and provides results pertaining to that listing type in seconds.

![Workout Jungle Screenshot](./docs/img/sc_filter.png)

#### **Message System:**

The message system allows users to message each other and discuss possible settlements of fitness equipment alongside delivery and payment options.

![Workout Jungle Screenshot](./docs/img/sc_inbox_page.png)
![Workout Jungle Screenshot](./docs/img/sc_conv.png)
![Workout Jungle Screenshot](./docs/img/sc_conv_mobile.png)

#### **Wish List:**

The Wish List feature allows users to 'bank' or 'store' their favourite listings in one space. The user can then return and view those listings without needing to search for them. The Wish List page also displays a number of indicators and functions to the user. These include:

- Important facts about the listing
- A link to view the listing
- Item quantity for each line item,
- Total price of all items within the user's Wish List
- The ability to remove items or remove duplicates
- Delete the Wish List

![Workout Jungle Screenshot](./docs/img/sc_wish_list.png)

![Workout Jungle Screenshot](./docs/img/sc_wish_list_mobile.png)

### **High-level components:**

![Workout Jungle Screenshot](./docs/img/workout_jungle_mvc_fw.png)

Workout Jungle is built upon a Ruby on Rails (Model-View-Controller) MVC Framework and consists of various front end, back end and cloud base software (See tech stack for full list). The above diagram breaks down Workout Jungle architectural framework and denotes how each component is handled. Observing the above framework and by MVC convention, the various components are assigned to different roles within the application's structure. At the framework's core, Ruby on Rails has been utilised to handle Workout Jungles routing, controller, model and view functionality. Through the help of Ruby gems such as simple_form, users were given a simple and clean interface to sign up, sign in, create and edit listings and send messages. Through devise, Ruby and PostgreSQL set authentication procedures for all users. Additionally, restrictive measures and accessibility were set in place on pages that contained particular user information. Cloudinary was utilised to store all uploaded images attached to the listing, resulting in less storage space being consumed on the application's side. Through the CSS framework Bootstrap Workout Jungle delivers a user-friendly and smooth experience of its layout and design.

#### **Example:**

When a user arrives on Workout Jungle, they sign in and wish to browse the All Listings Page. By clicking on the navbar link, the user through their browser sends a http request to the server. Heroku then informs the controller a user wishes to access the All Listings Page. The controller interacts and instructs the model to query the database through active records to retrieve all user listings and attached images from the database. The model through PostgreSQL then queries Cloudinary (Workout Jungles image cloud based service) and retrieves images that are associated with all listings posted on the site based on listing_id and blob_id. Once PostgreSQL has compiled all relevant data, it relays it back to the model which in turn informs the controller. The controller then executes the appropriate views and displays the listings and attached images alongside HTML, partials, CSS and Javascript back to the browser and user.

Although the above example was a basic explanation of how Workout Jungle's framework operates, it depicts how the various components of the framework interact with each other.

### **Third Party Services:**

Workout Jungle utilises third party services such as Heroku and Cloudinary to further enhance its performance, efficiency and scalability.

#### **Heroku:**

Deploying Workout Jungle on Heroku allowed for faster and more effective building of the application's core functionality. This meant focus could be placed on the source code of the application rather than the infrastructure itself. Heroku allowed Workout Jungle to be developed, tested and updated with minimal to no downtime. The service removed friction between balancing the needs of development cycles and server maintenance and supervision. Thanks to its user-friendly and powerful dashboard, in conjunction with command line support, Workout Jungle was able to be deployed from an early stage. This allowed for continuous deployment and frequent updates to be made from GitHub without impeding on the development cycle and sprints of particular features. Heroku provided various supportive tools, features and rich documents that helped soften the learning curve and helped to provide a quick, efficient and effective deployment.

#### **Cloudinary:**

Integrating Cloudinary into Workout Jungle's development allowed for a more easy, efficient and effective manner in which to approach and handle asset management in the application. Cloudinary provides an easy solution to store attached images uploaded by users to Workout Jungle without impeding on server or database memory and storage capacities. Additionally, Cloudinary provided the ability to not only store images, but offered features to manipulate, format and optimise images for more efficient behaviour. Cloudinary also provides fast and optimised CDN delivery, detailed and informative documentations, alongside strong support integration for Workout Jungle's development sprints.

### **ERD:**

![Workout Jungle ERD](./docs/img/workout_jungle_in_erd.png)

The above ERD represents Workout Jungle's initial database design and structure. It consists of the following entities:

**Users:**
Contains information related to the user; username, email, password, an admin foreign key and has a primary key of the user_id. Users can have zero to many conversations, while a conversation can only belong to one user with another user. A user can also have zero to many listings and zero to many carts. However a listing and a cart can only belong to one user. Finally a user does not have to be an admin, but an admin needs to belong to one user.

**Admins:**

Contains a primary key of admin_id and a admin only password. Admins need to belong to one user, yet a user does not need to be an admin (optional).

**Listings:**

Contains a primary key of listings_id, and houses information about each listing; title, description, condition, price, listing_type alongside foreign keys for the images and users tables. Listings can belong to zero to many carts, while a cart has one to many listings. A listing must have one image, and an image must belong to one listing. A listing belongs to one user, but a user has many listings.

**Images:**

The images table holds a primary key of image_id and the following; name of image, file type, file size and storage (local or cloud based). An image belongs to one listing and a listing has one image.

**Carts:**

The Carts table has a primary key of cart_id, contains the quantity of the item within the cart itself and two foreign keys belonging to users and listings. A cart belongs to one user while a user can have zero to many carts.

**Conversations:**

The Conversations table has a primary key of conversations_id with two main columns of sender_id and recipient_id and a foreign key to the user table. A conversation belongs to one user with another user, while a user can have zero to many conversations. A conversation has zero to many messages, while a message belongs to one conversation.

**Messages:**

Contains a primary key of message_id, every message has a body of text, and a foreign key to the conversations table. A message belongs to one conversation while a conversation has many messages.

### **Database Schema Design:**

Below Workout Jungle's Database Schema shows that through development, several changes occurred that altered the tables within the database and their relationships with each other.

```r
ActiveRecord::Schema.define(version: 2021_03_12_023809) do

  enable_extension "plpgsql"
    # These are extensions that must be enabled in order to support this database
    # Created from active storage install command
  create_table "active_storage_attachments", force: :cascade do |t|
    # Name of uploaded attachment
    t.string "name", null: false
    # Type of file uploaded
    t.string "record_type", null: false
    # id given to each attachment
    t.bigint "record_id", null: false
    # id given to blob/image
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end
 
  create_table "active_storage_blobs", force: :cascade do |t|
    # Image Table used to hold images uploaded by users.
    # Created from active storage install command
    # Key indicator assigned to an image
    t.string "key", null: false
    #Filename of image
    t.string "filename", null: false
    # Type of MIME type of uploaded file
    t.string "content_type"
    #Attached data to image(filename,content type etc)
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    # t.index means it is adding a database index to the referenced column, the role of indexes aids in speeding up queries. 
    # Without an index, the database would need to check every record in the projects table, one by one, until a match is found.
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

   create_table "admins", force: :cascade do |t|
    # Created when devise command was run to create the admin model
    # Should be noted that admin model does not require admin only passwords, emails or usernames (It relies on the username table)
    # Admin's email set to default until admin enters it(not needed in Workout Jungle structure)
    t.string "email", default: "", null: false
    # Admin's password set to default until admin enters it(not needed in Workout Jungle structure)
    t.string "encrypted_password", default: "", null: false
    # Database calls this token when user wishes to store a new password in place of their old one
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["email"], name: "index_admins_on_email", unique: true
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carts", force: :cascade do |t|
    # Created with a cart migration
    # Carts table acts as a storage to hold a user's wish list, they hold line_items which house the listings(items)
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    # Created when conversation model was scaffolded
    # Each user is assigned a sender_id and recipient_id for every conversation they have with another user
    # Example: if Tom messages Kate, Tom is assigned a sender_id, while Kate is assigned a recipient_id, however the roles would be reversed if Kate messaged Tom
    # The model then queries based on the two indexes when creating the conversation between the two users
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "line_items", force: :cascade do |t|
    # Created with line_item migration
    # Foreign key for listing_id
    t.bigint "listing_id", null: false
    # Foreign key for cart_id
    t.bigint "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # A value that represents the amount of an item assigned to the line_item, for example: 20kg Plate x 2 (meaning there are two plates within that line item)
    t.integer "quantity", default: 1
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["listing_id"], name: "index_line_items_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    # Created when listing model was scaffolded 
    # A listing has a title
    t.string "title"
    # A listing has a description
    t.text "description"
    # A listing has a condition
    t.string "condition"
    # A listing has a price with a default of $0
    t.decimal "price", precision: 5, scale: 2, default: "0.0"
    # A listing has a listing_type(category)
    t.string "listing_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # Foreign key of user_id to associate one listing to one user
    t.integer "user_id"
  end

  create_table "messages", force: :cascade do |t|
    # Created when message model was scaffolded
    # A message has a body of text displaying related information between users
    t.text "body"
    # A message belongs to one conversation (foreign key)
    t.bigint "conversation_id"
    # A message belongs to one user (foreign key)
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
     # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    # Created when devise command was run to create the user model
    # Each user has an email, defaulted to an empty string until they sign up
    t.string "email", default: "", null: false
    # Each user has a password defaulted to an empty string until they sign up
    t.string "encrypted_password", default: "", null: false
    # Database calls this token when user wishes to store a new password in place of their old one
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    # Each user has a username, defaulted to an empty string until they sign up
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # By default, admin for all users is set to false, when set to true through seeding, or admin dashboard, they are considered an admin
    t.boolean "admin", default: false
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["email"], name: "index_users_on_email", unique: true
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
  #Adding foreign keys to tables:
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "listings"
end
  
```

**Users/Admin:**

Utilising the devise gem, the users and admins table reflects the original design shown in the above ERD. However after the first sprint, it was decided to change the foreign key of admin_id into a boolean. Used as a "switch", the boolean allows an admin to toggle it on to assign another user as an admin.

**Listings:**

Listings maintained the same structure its ERD counterpart had. The only difference was its image_id was removed, and through active storage an image is attached to each listing through a blob_id. A listing has one image attached, and an image belongs to one listing.

**Active_storage_blobs:**

Through active storage, this table was created to store all images uploaded by users, and indexes blob_id to the listings they are attached to.

**Carts/Line_items:**

The Carts table was spilt into two separate tables; carts and line items. The Cart table holds user carts (wish lists) and houses the line items. The Line_items table contains one attribute of quantity which is assigned to the copies of listings placed within one line item. It then has foreign keys to the listings and cart id.

**Conversations/Messages:**

 The Conversation table retains its sender_id and recipient_id. The foreign key to users table was removed and was added to the messages table. When the conversations controller is called to create a new conversation, it assigns the current user with the sender_id and the other user with a recipient_id. The messages table then holds the actual body of text exchanged each time by the two users, with foreign keys referencing users and conversations table. This allows the message model to effectively and efficiently query the database based on those two indexes.

### **Model Relationships**

Below are all model relationships present in Workout Jungle's source code.

**User:**  

The user model has a many listings association, as in a user can have zero to many listings on the site. Due to the dependent: destroy, if a user is deleted from the database, then all their associated listings will be deleted as well. This prevents any orphan listings being left behind.

  ```r
  has_many :listings, dependent: :destroy
  ```

**Listing:**  

The listing model shows that a listing belongs to one user, and making it optional means a user may have zero to many listings. The relationship does not require a user to have a minimum of one listing.

A listing has one attached image which allows a user to attach an image every time they wish to post a new listing. Every listing has an image id relating to the active_storage_attachments table. Within this table, each attachment contains a blob_id that references the active_storage_blobs table. This table contains all images pertaining to Workout Jungle. Every time a listing is called due to this association, we can fetch the associated image belonging to that listing through these relationships.

A listing has many line_items and can belong to multiple carts (wish lists). If a user adds a particular listing to their cart, it does not prevent another user from adding it to their cart.

  ```r
    belongs_to :user, optional: true
    
    has_one_attached :image
  
    has_many :line_items
  ```

**Cart:**

The cart model has many line items, meaning that a user can add several different listings to a cart, and that cart can hold all line_items needed to house the listings. Due to the dependent: destroy function, whenever a cart is destroy by the user the line_items it housed will be destroyed as well, preventing any orphan line_items remaining.

  ```r
   has_many :line_items, dependent: :destroy
  ```

**Line_item:**

The Line_item model defines the relationship in which a line_item belongs to a particular listing and a particular cart. If a line_item is currently housing one item (listing) it cannot house another. Instead another line_item is created to house the new listing. Likewise, once a line_item is created for a cart, it is unique for that cart_id and cannot be placed within another cart. A new line_item would need to be created and placed within that new cart.

  ```r
  belongs_to :listing

  belongs_to :cart
  ```

**Conversation:**

The conversation model defines that a conversation belongs to a sender_id and recipient_id as foreign keys. This can be explained through the ```scope :between``` defined in its model. When called upon, the scope through the controller assigns two ids of sender and recipient. Using the example from above; Kate spots a listing she wishes to find out more about and notices the listing was posted by Mark. Kate then wishes to send Mark a message. When Kate clicks on the message user button, it will direct to Mark's message page because it assigns Kate with the sender_id and the listings user with the recipient_id. If the roles were reversed, Mark would have a sender_id and Kate would have been assigned with the recipient_id. Once both ids have been assigned, the controller calls the create method and creates a conversation based on the two user ids. Hence a conversation belongs to a sender_id and a recipient id. If either user is deleted from the database, then that conversation would be deleted as well.

A conversation has many messages as once the sender_id and recipient_id have been assigned and a conversation has been created, the various messages exchanged between the two users comprise the conversation. If the conversation is deleted, then all relevant messages belonging to that conversation will be deleted as well.

  ```r
  belongs_to :sender, foreign_key: :sender_id, class_name: "User", dependent: :destroy
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User", dependent: :destroy

  has_many :messages, dependent: :destroy

  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR 
    (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end
  ```

**Message:**

The message model reflects the conversation model, as messages between two users belong to the conversation. A message is unique to a particular conversation.

A message also belongs to a user through either a sender_id or recipient_id.

  ```r
  belongs_to :conversation
  
  belongs_to :user
  ```

### **Database Relations:**

![Workout Jungle Updated ERD](./docs/img/workout_jungle_final_ERD.png)

The above image depicts an updated ERD of Workout Jungle. See the model relationships section above for the associations between each entity.

**Admin/User Relations:**

The users table has an admin boolean set to default. When set to true, Workout Jungle associates that user account to have the role of admin. The admins table has a foreign key of email which relates a user to the admin table by their email. This relation was established by devise.

**Messages Relations:**

The messages table contains two foreign keys. The conversation_id informs the database that any given message on Workout Jungle belongs to a specific conversation between two users. The user_id informs the database that the message belongs to a specific user and is indexed by that user_id.

**Listings Relations:**

The listings table contains two foreign keys. A listing belongs to one user, so the user_id informs the database that a particular listing belongs to that specific user. A listing has one attached image. The listings table image_id points to the active_storage_attachments table in which a foreign key then points to the active_storage_blobs table. This blobs table contains the image attached to the listing.

**Line_item/Carts Relations:**

The Line_items table contains two foreign keys. Listings can have zero to many line_items, a specific line_item can only house one listing. The foreign key informs the database which listing the line_item pertains to through the listings_id. Finally, a cart can have zero to many line_items while a line_item belongs to one cart. The database is informed which cart the specific line_item belongs to through the cart_id foreign key.

### **Roadmap - What's Next?**

The current version of Workout Jungle has met user stories and requirements by providing a user-friendly and safe space to buy and sell fitness equipment. However, through potential ethical issues and changing landscapes, it is vital that continuous updates and features are rolled out to better optimise the application's full potential and reach maximum market share. The following are planned updates and feature changes to ensure users of Workout Jungle receive the ultimate experience.

**Admin Dashboard:**

1. Division of responsibilities with the introduction of a moderator role. Moderators will handle listings and conversations between users, while the Admin role will conduct oversight on user registrations, admissions and activities.
1. Staff-only chat so all admin and moderators can discuss day to day operations and security matters.
1. All admin and moderators will have their own admin username and passwords to introduce a second level of security.

**Users:**

1. Users will have a bio section in their profile
1. Avatar/Display Picture connected with their profile.
1. Silent message feature in which users decided to toggle messaging on and off. If off, other users will not be able to message or even search for that user.

**Listings:**

1. The introduction of a search/advanced search system
1. Users will be able to upload multiple images attached to their listings.

**Chat System:**

1. Notifications which alert users of new conversations and messages from fellow users, admins and moderators.
1. User will be able to append images through messages.
1. Emoji system.
1. Moderators and Admins will have the ability to delete disrespectful messages if found to be breaking any terms and conditions.

## **References:**

Lufkin, B 5 May 2020, The evolution of home fitness, bbc.com, worklife, article, viewed 1 March 2021, https://www.bbc.com/worklife/article/20200504-covid-19-update-quarantine-home-workouts-during-coronavirus

Plastow, K 5 May 2020, Sports retailers on track for personal best following spike in demand, thenewdaily.com.au, finance, consumer, viewed 1 March 2021, https://thenewdaily.com.au/finance/consumer/2020/05/05/sports-sales-anz-coronavirus/

Reid, E 24 March 2020, Home GY Equipment New Target of Covid-19, channelnews.com.au, viewed 1 March 2021, https://www.channelnews.com.au/home-gym-equipment-new-target-of-covid-19-panic-buying/
