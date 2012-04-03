class LotteryticketController < ApplicationController
  def show
    @lotteryticket = Lotteryticket.find(params[:id])
    @groups = Group.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @lotteryticket }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @lotteryticket = Lotteryticket.new
    @groups = Group.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @lotteryticket }
    end
  end

  # GET /users/1/edit
  def edit
    @lotteryticket = Lotteryticket.find(params[:id])
    @groups = Group.all
  end

  # POST /users
  # POST /users.json
  def create
    @lotteryticket = Lotteryticket.new(params[:user])

    respond_to do |format|
      if @lotteryticket.save
        format.html { redirect_to @lotteryticket, :notice => 'Lottery Ticket was successfully created.' }
        format.json { render :json => @lotteryticket, :status => :created, :location => @lotteryticket}
      else
        format.html { render :action => "new" }
        format.json { render :json => @lotteryticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @lotteryticket = Lotteryticket.find(params[:id])

    respond_to do |format|
      if @lotteryticket.update_attributes(params[:user])
        format.html { redirect_to @lotteryticket, :notice => 'Lottery Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @lotteryticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @lotteryticket = Lotteryticket.find(params[:id])
    @lotteryticket.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def index
    @lotterytickets = Lotteryticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lotterytickets }
    end
  end
end
