class ClubsController < ApplicationController
  before_action :authenticate

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
      if !@club.students.find_by_id(current_student.id)
        render 'public/403.html'
      end
  end

end
