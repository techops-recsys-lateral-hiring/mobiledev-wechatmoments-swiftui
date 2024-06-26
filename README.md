# mobiledev-wechatmoments-swiftui

### App Introduction

The code is an iPhone app which looks like Wechat Moments page. 

We have some requirements during building this app, and you should also try to follow these requirements:


### Requirements
1. Node.js version 12.0+ [Download](https://nodejs.org/en/download/)
2. npm - via [Node.js installer](https://nodejs.org/en/download/) or [nvm](https://github.com/nvm-sh/nvm#install--update-script)

### Setup the project
1. Locate the current directory in terminal
2. Start backend server
   1. Execute `npm install -g mountebank`
   2. Execute `mb --configfile imposters.ejs` and keep the terminal open.
3. Start the iOS application
   1. Open `WeChatMoments.xcodeproj` in the current directory and ensure that SPM (Swift Package Manager) frameworks are ready
   2. Run the project and make sure the app can start correctly (don't worry about if the features are not working properly)
4. To validate your setup, please check items below.

| Expected app screen  | Expected log that produce by step 2.ii |
| -------- | ------- |
|  <img src="https://github.com/techops-recsys-lateral-hiring/mobiledev-wechatmoments-objectiveC/assets/17498546/46d51f98-f97c-4b5c-9f7b-682b1a906f93" alt="wechat_moments_2" height=200 />|  <img src="https://github.com/techops-recsys-lateral-hiring/mobiledev-wechatmoments-objectiveC/assets/17498546/0ca432b9-f782-43e4-a8e5-b7e133afe380" alt="wechat_moments_2" height=100 />  |










#### Project overview

The below screenshots are from Wechat App, they are for reference/inspiration these do not represent the actual output from the given codebase.

<img src="https://user-images.githubusercontent.com/61306682/131655545-cfa011b4-637f-45db-bb26-3bb9c986b94b.png" alt="wechat_moments_2" height=350 /> <img src="https://user-images.githubusercontent.com/61306682/131655537-43e4ab0b-29f0-456d-bf2a-0fcf3de0ba2c.jpg" alt="wechat_moments_3" height=350 /> <img src="https://user-images.githubusercontent.com/61306682/131655555-608f9b7e-5cb7-4059-abbc-f70dfd00fe06.jpg" alt="wechat_moments_1" height=350 />
##### Expected application behaviours
- The project is an iPhone app which looks like Wechat Moments page. 
- The page consists of profile image, avatar and tweets list
- For each tweet, there will be a sender, optional content, optional images and comments
- A tweet contains from 0 to 9 images
- Pulling down table view to refresh, only first 5 items are shown after refreshing
- All tweets are fetched and stored in memory at the first time and only show first 5 of them at the beginning and after refresh.
- Show 5 more while user pulling up the view at the bottom of the table view.
- Supports layout on all kinds of iOS device screen and orientation.
- This is a static page.

#### Tech requirements:

- The data JSON will be hosted at localhost:2727
- An example of the response in `WeChatMomentsTests/Resources/Tweet.json` 
- Layout using swiftUI
- Unit tests are appreciated.
- Functional programming is appreciated
- Utilise GCD for multi-thread operation
- Only binary, framework, Cocopods or SPM dependencies are allowed. do not copy other developer's source code(`*.h`, `*.m`, `*.swift`) into your project
- Keep your code clean as much as possible Production and Technical requirements are weighing equally in the final result.
