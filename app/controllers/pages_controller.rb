class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @new_outfit = Outfit.new
  end

  def about
    @new_outfit = Outfit.new
  end
end
