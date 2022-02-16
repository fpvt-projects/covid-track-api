# Covid Track API

Covid-track-API project aims to help track record of covid test result by PH consumers that uses test-kits bought from online stores.

Try with postman

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/a6dd53dd8ffb20f44e0b)

API Link: **https://c0v1dtrackingapi.herokuapp.com/**

## How to run the application with front-end
### Covid-track-api
1. In order to fully run the utilize the application you need the React app https://github.com/fpvt-projects/covid-track-app/
2. Install dependencies, run `npm i` command.
3. Change the axios base url to http://localhost:3001 in the App.js file.
4. Start the web server using `npm start` command. The app will be served at http://localhost:3000.
5. Fork or download the api, then run `bundle install` from this repository
6. Run `rails db:migrate` and `rails db:seed` to setup the database.
7. Run the api server using `rails s -p 3001` to avoid conflict with the react server.


## Features
- Mobile view responsiveness.
- Registration
  - Account registration with automatic sign in.
  - Can also submit test result in the registration.
- Journal
  - Helps monitor the user's condition.
  - Users can create, edit, and delete journal entries.
- Submit result & result log
  - Users are able to submit record of their test results.
  - Users are able to view result logs.
- Chart & Counts
  - Able to view numbers of covid data.
- News updates
  - Get updated with the latest news.
  - Images, title, content, and link to the original article of the news.

## Dependencies
```
* Ruby 3.0.0
* Rails 7.0.1
* yarn 1.22.15
```

## Task list
- [ ] Users will able to add pictures for results
- [ ] Users are able to upload profile pictures
- [ ] API will generate QR codes specific for each users showing their results and profile
- [ ] Will add Admin and Medical Roles
- [ ] Integrate React Front-end with the API



