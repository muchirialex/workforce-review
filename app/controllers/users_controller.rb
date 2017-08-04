class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_creator!, except: [:index, :show]
	def index
		if params[:category].blank?
			@users = User.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)
		else
			@category_id = Category.find_by(name: params[:category]).id
			@users = User.where(category_id: @category_id).order("created_at DESC").paginate(page: params[:page], per_page: 5)
		end
	end

	def show

	end

	def create 
		@user = User.new(users_params)

		if @user.save
			redirect_to @user
		else
			render "new"
		end
	end

	def new 
		@user = User.new
	end

	def edit
	end

	def update
		if @user.update(users_params)
			redirect_to @user
		else
			render "edit"
		end
	end

	def destroy
		@user.destroy
		redirect_to root_path

	end

	private 

	def users_params
		params.require(:user).permit(:name, :bio, :category_id, :category_name, :image, :slug)
	end

	def find_user
		@user = User.friendly.find(params[:id])
	end




end
