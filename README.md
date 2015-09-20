# gt-connect

#### a tool to connect github (g) and trello (t)

This small Sinatra app listens to webhooks from Github and takes appropriate action in Trello.

### features

* creates Trello board after repo creation
* adds Trello users to board when given Github access to corresponding project
* adds (via rake task) new team members quickly and easily to project
* links Github branches to corresponding cards in Trello (pending)
* syncronizes list names among all Trello boards upon creation
* moves cards into "Doing" when new feature/bug branch is pushed (pending)
* moves cards into "Pending Merge" when pull request is submitted (pending)
* moves cards into "Done" when branch is merged (pending)
* (& more!)

### development

* obtain ENV vars from admin (@naserca)
* `bundle`
* `rake db:create`
* `rake db:migrate`
* play with `tux`
* run server with `shotgun` on a port of your choosing

### production

* ask admin for Heroku project access
* `git remote add heroku git@heroku.com:funci-gt-connect.git`
* `git push heroku master`
