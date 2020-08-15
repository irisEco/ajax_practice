class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render :layout => false
  end

  def create

    @user = User.create(user_params)
    @uuid = UUID.new
    puts '-------------------------------'
    puts @uuid.generate
    puts user_params
    puts '-------------------------------'
    # @user_member = User.create(name:"test",email:"wedwe",uuid:@uuid.generate,phone:"12344",parent:@user)

    redirect_to admin_users_path

  end

  # def register
  #
  # end
  #
  def login
    @user = User.where({name:params[:user][:name],pass:params[:user][:pass]})

    if @user.present?
      # binding.pry
      puts '--------------'
      puts @user.ids
      puts '--------------'
      redirect_to  admin_user_path(id:@user.ids)
    else
      flash[:notice] = 'Invalid email/password combination' # 不完全正确
    end


  end


  private

  def user_params
    params.require(:user).permit(:name,:pass,:email,:uuid)
  end

end