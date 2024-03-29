class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @users = @group.users.all
    @rss = getLottoRss

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @group }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @group }
    end
  end

  # GET /users/1/edit
  def edit
    @group = Group.find(params[:id])
    @users = @group.users.all
  end

  # POST /users
  # POST /users.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, :notice => 'Group was successfully created.' }
        format.json { render :json => @group, :status => :created, :location => @group}
      else
        format.html { render :action => "new" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, :notice => 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @groups = Group.find(params[:id])
    @groups.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @groups }
    end
  end
  
  def getLottoRss
    require 'feedzirra'
    feed = Feedzirra::Feed.fetch_and_parse("http://www.txlottery.org/export/sites/lottery/rss/tlc_latest.xml")
    feed.entries.each do |entry|  
      if(entry.url == 'http://www.txlottery.org/export/sites/default/Games/Mega_Millions/' && 
            entry.title.index("Mega Millions Winning Numbers for") != nil)
        return entry
      end  
    end  

  end
end
