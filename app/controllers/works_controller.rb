class WorksController < ApplicationController
  def index
    @works = Work.order('created_at DESC')
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
    @works = Work.order('created_at DESC')
  end

  def edit
    @work = Work.find(params[:id])
  end

  def destroy
    @work = Work.find(params[:id])
      if @work.destroy
        @works = Work.order('created_at DESC')
        render :index
      else
        render :show
      end
  end

  def update
    @work = Work.find(params[:id])
      if @work.update(work_params)
        render :show
      else
        render :edit
      end
  end

  private
  def work_params
    params.require(:work).permit(:name, :introduction, :address, :url, :photo, user_ids: [])
  end

end
