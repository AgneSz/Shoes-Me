class UsersController < ApplicationController
  #no methods for user => function supported by devise
  #we will not edit/update/destroy users

  #links for user to: add outfit - could be simple_form or method new from outfit
  #see all outfits - current_user.outfits
  #redirect_to => outfit page to dispaly uploaded outfit
  #simple_form on user page +> takes you to outfit show page
def show
 @user = current_user
end

end
