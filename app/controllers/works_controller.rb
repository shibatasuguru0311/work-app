class WorksController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @work = Work.new
    else
      redirect_to new_user_session_path
    end
  end


  def create
    @work = Work.new(work_params)
    if @work.save!
    else
      render :new
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  private
  def work_params
    params.require(:work).permit(:name, :introduction, :address, :url, :photo, user_ids: [])
  end

end
