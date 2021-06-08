class UsersController < ApplicationController
  #no methods for user => function supported by devise
  #we will not edit/update/destroy users
  def show
    @outfit = Outfit.new
    @user = User.find(params[:id])
  end
end
