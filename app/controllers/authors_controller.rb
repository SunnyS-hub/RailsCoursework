class AuthorsController < ApplicationController
before_action :require_admin
private
    def params_hash
      params.require(:author).permit(:name)
    end

    
    def require_admin
      if !current_user || !current_user.admin?
        flash[:danger] = "Not permitted"
        redirect_to root_path
      end
    end

public
  def new
    @author= Author.new
  end

  def create
    @author = Author.new(params_hash)
    if @author.save
      flash[:success] = "Auther successfully added"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def index
    @allAuthors = Author.all
  end



  def destroy
    @author = Author.find(params[:id])
    if @author.present?
        @author.destroy
    end
    flash[:danger] = "Author deleted"
    redirect_to authors_path
  end
end
