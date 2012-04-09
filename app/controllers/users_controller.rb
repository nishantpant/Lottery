class UsersController < ApplicationController
  def show
    @user = User.find((params[:id]))
    @groups = @user.groups

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find((params[:id]))
    @groups = Group.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user}
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find((params[:id]))

    respond_to do |format|
      if @user.update_attributes(params[:user])
        group_ids = params[:groups].collect {|id| id.to_i} if params[:groups]
        
        if group_ids
          group_ids.each do |id|
            r = @user.groups.find_by_id(id)
            if r == nil
              group = Group.find(id)
              group.users << @user
              group.save
            end
          end
        end
    
        redirect_to :action => 'edit', :id => :@user.id 
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @users = User.find((params[:id]))
    @users.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end
end
