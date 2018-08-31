# Veterinary Practice Management Tool

## Demo
A live demo can be found here: https://stormy-temple-84763.herokuapp.com/

Log in using guess details:
|          |          |
|----------|----------|
| Email: | guest@vpmt.com |
| Password: | chicken |

-----

## About
VPMT has been designed to be as easy to use as possible with a core mission to ensure any service management task can be performed quickly and easily.

To do achieve this, VPMT is built using two main technologies:
1. Ruby on Rails API for rapid development; and
2. Vue.js for a seamless and component-driven front end.

### Tech Specs
| Framework/Lang | Version |
|----------------|---------|
| Ruby           | 2.5.1p57 |
| Ruby on Rails  | 5.2.1   |
| Vue.js         | ^2.5.17 |
| Rails Webpacker | 3.5 |
| PostgreSQL | 10.5


### Custom Components
| Component | Description |
| --------- | -----------
| [Vue Hash Router](https://github.com/zailleh/vue-hash-router) | Custom-build hash router for handinling page changes and url params
| Vue Popup | Custom component for dynamically handling the creation of popups

----
## Features
* Manage Clients
* Manage Patients
* Manage Admissions
  * Record TPRs
  * Categorise admits by type (boarding / hospital / proceedure / stray / etc)
* Easily append notes, Tprs, etc from any screen
* Easily trace a patient's history all in one location
* Fast navigation and data loading.

### Planned Features
* Manage staff
  * Create new staff
  * Manage shifts/rosters
  * Payroll
* Manage Consumables
  * Easily bill clients
  * Record consumables used per intervention
  * Summarise all consumables for easy invoicing
  * Manage suppliers and stock levels
  * Re-Order consumables
---
## Installation
### Prerequisites

**APIs**

This application uses the Cloudinary API to upload patient and staff images.
Prior to launching, please ensure you have a `CLOUDINARY_URL` environment variable.

Add the following line, with your own url, to your bash profile.
``` sh
export CLOUDINARY_URL=cloudinary://{stuffandthings}:{morestuffandthings}@{cloudinary}
```

To initialise the database with demo data:
```
rails db:create && rails db:migrate && rails db:seed
```
## Heroku Deployment
If you have the environment variable above, you can simply run this command to get your Heroku environment to have the variable, too:
``` sh
heroku config:set CLOUDINARY_URL=$CLOUDINARY_URL
```


## Testing
Only primary models (not lookup data models) have tests.

To run all tests:
```
bundle exec rspec
```