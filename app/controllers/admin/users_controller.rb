class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @child_user = @user.subtree.order(:id).limit(6)

    puts '------------------------------'
    puts @child_user
    puts '------------------------------'

  end

  def new
    @user = User.new
    @uuid = params[:uuid]
    render :layout => false
  end

  def create
    #如果邀请码不存在,则是新建用户
    if params[:user][:uuid].empty?
      @user = User.create(user_params)
      @user.uuid = UUID.new.generate
      @user.save
    else
      #如果邀请码存在,则是邀请注册用户
      @user = User.where(uuid: params[:user][:uuid]).first
      #如果是邀请注册的老用户存在
      if @user.present?
        @child_user = User.create! :name => params[:user][:name], :pass => params[:user][:pass], :email => params[:user][:email], :uuid => UUID.new.generate, :parent => @user
        puts '---------@user.children--------'
        puts @user.children
        puts '-----------------'
      else
        #如果邀请注册的老用户不存在
        flash[:notice] = "邀请码时效!"
      end
    end


    redirect_to admin_users_path

  end

  # def register
  #
  # end
  #
  def login
    @user = User.where({name: params[:user][:name], pass: params[:user][:pass]})

    if @user.present?
      puts '--------------'
      puts @user.ids
      puts '--------------'
      redirect_to admin_user_path(id: @user.ids)
    else
      flash[:notice] = 'Invalid email/password combination' # 不完全正确
    end


  end

  def index
    @user = User.first
  end


  private

  def user_params
    params.require(:user).permit(:name, :pass, :email, :uuid)
  end

end