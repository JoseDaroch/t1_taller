class EntryController < ApplicationController
  before_action :logged_in_admin, only: [:create, :destroy]

  def show
    @user = User.find(params[:id])
    @entry = @user.entry.paginate(page: params[:page])
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

end
