class HomeController < ApplicationController
  def index
    @locations = Location.all

    if request.post? && current_user.update(user_params)
      flash[:notice] = 'Location updated successfully.'
      puts "Location is changed to: #{current_user.location_id}"
      redirect_to root_path
      return
    end

    render
  end

  private

  def user_params
    params.require(:user).permit(:location_id)
  end

end
