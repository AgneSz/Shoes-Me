class UsersController < ApplicationController
  #no methods for user => function supported by devise
  #we will not edit/update/destroy users
 @user = current_user
end
