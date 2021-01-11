class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to controller: :posts, action: :index, type: 'village', id: current_user.village_id
    end
  end
end
