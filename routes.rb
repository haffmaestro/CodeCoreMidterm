                  Prefix Verb   URI Pattern                                 Controller#Action
        new_user_session GET    /users/sign_in(.:format)                    devise/sessions#new
            user_session POST   /users/sign_in(.:format)                    devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
           user_password POST   /users/password(.:format)                   devise/passwords#create
       new_user_password GET    /users/password/new(.:format)               devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
                         PATCH  /users/password(.:format)                   devise/passwords#update
                         PUT    /users/password(.:format)                   devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
       user_registration POST   /users(.:format)                            devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
                         PATCH  /users(.:format)                            devise/registrations#update
                         PUT    /users(.:format)                            devise/registrations#update
                         DELETE /users(.:format)                            devise/registrations#destroy
                    root GET    /                                           ideas#index
           idea_comments GET    /ideas/:idea_id/comments(.:format)          comments#index
                         POST   /ideas/:idea_id/comments(.:format)          comments#create
        new_idea_comment GET    /ideas/:idea_id/comments/new(.:format)      comments#new
       edit_idea_comment GET    /ideas/:idea_id/comments/:id/edit(.:format) comments#edit
            idea_comment GET    /ideas/:idea_id/comments/:id(.:format)      comments#show
                         PATCH  /ideas/:idea_id/comments/:id(.:format)      comments#update
                         PUT    /ideas/:idea_id/comments/:id(.:format)      comments#update
                         DELETE /ideas/:idea_id/comments/:id(.:format)      comments#destroy
              idea_likes POST   /ideas/:idea_id/likes(.:format)             likes#create
               idea_like DELETE /ideas/:idea_id/likes/:id(.:format)         likes#destroy
              idea_joins POST   /ideas/:idea_id/joins(.:format)             joins#create
               idea_join DELETE /ideas/:idea_id/joins/:id(.:format)         joins#destroy
                   ideas GET    /ideas(.:format)                            ideas#index
                         POST   /ideas(.:format)                            ideas#create
                new_idea GET    /ideas/new(.:format)                        ideas#new
               edit_idea GET    /ideas/:id/edit(.:format)                   ideas#edit
                    idea GET    /ideas/:id(.:format)                        ideas#show
                         PATCH  /ideas/:id(.:format)                        ideas#update
                         PUT    /ideas/:id(.:format)                        ideas#update
                         DELETE /ideas/:id(.:format)                        ideas#destroy
    api_idea_attachments POST   /api/ideas/:idea_id/attachments(.:format)   api/attachments#create
