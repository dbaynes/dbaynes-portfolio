
# Portfolio Application 


## Summary
The intention of this project is to gain a strong working knowledge of a Rails 4.2 web application that 
uses the zurb foundation responsive front-end framework and Devise for User access, athentication and
authorization. 

Application begins with the 'start' action (root :to => 'projects#start'). A portfolio has many different 
portfolio types. In this case, Professional, Education, Arts, Athletics, Recreational. Each portfolio type 
has a project. And each Project Type can have it's own posts.

## Flow
- Start: Presents Portfolio Types - Select Portfolio Type
- Portfolio Type (index or projects_path filtered by portfolio_type)
	- Projects: title, timeframe, location, project description
		- Posts: title, content

Experience and expertise gained here will be applied to the class project Klusters.

## Environment
- ruby 2.1.0
- rails 4.0.2
- Devise 3.2.3
- CanCan
- postreSQL 9.3.3
- zurb-foundation 4.3.2


## Developer
- David Baynes

## Project References

- https://github.com/plataformatec/devise
- http://www.postgresql.org/docs/9.0/static/sql-createdatabase.html
- http://railscasts.com/episodes/235-devise-and-omniauth-revised?view=asciicast
- http://railscasts.com/episodes/209-devise-revised?view=asciicast
- http://railscasts.com/episodes/417-foundation 
- https://github.com/zurb/foundation

## Authentication Added
	-	guest - no login
	-	can post comments
	-	editor
	-	can post comments
	-	can publish/unpublish posts
	-	username: editor@editor.com
	-	pw: editorship
	-	admin
	-	can post comments
	-	can add projects
	-	username: admin@admin.com
	-	pw: admin
	
### Roles:
	- Admin: 
		- Can see everything
		- Can Create Project
		- Can Edit and Delete Project
		- Has Users tab to edit user
		- Can add/change roles
		- Can delete users
		- Can add portfolio type where image is uploaded.
			A link will be available to admin after login on the Start Page to 'Customize' the portfolio, add new projects 
			and upload an image.
		
	- Editor
 		- Can approve posts
		- Can approve comments
	- User
		- Can post
		- Can comment on posts
		- Can see only approved comments and posts
	- Guest
		- Can see only approved comments and posts
Notes on Comments:
	- If signed in, add a comment option is ready for a post
	- Must be logged in to comment
	- Can delete only your own comment
	- Can see your comment whether approved or not
	- Editor can approve/unapprove comments for public view (readonly)
	- Editor can delete comments
Team Project:
	-	Project conception where idea for an application was developed. 
	-	made gem determination for uploading documents 
	-	Built initial scaffolding and initial proof of concept for paperclip gem selection
	-	Created initial document model 
	-	Added CRUD for document model 
	- Added Polymorphic Comments to application - Collaborated with Adam Hendricksen

=======

Date: Tuesday February 19, 2014
