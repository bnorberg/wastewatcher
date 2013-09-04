class WeighingsController < ApplicationController
  # GET /weighings
  # GET /weighings.json
  def index
    require 'csv'
    @weighings = Weighing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weighings }
      format.csv do
	      @weighings = Weighing.all
       	csv_string = CSV.generate do |csv|
      	   #header
      	   csv << ["date", "time", "weight", "duration", "meal", "location", "session number"]
      	   @weighings.each do |w|
            #data rows
        		 csv << [w.created_at.to_s.split(' ')[0], w.created_at.to_s.split(' ')[1], w.weight, w.duration, w.session.meal,  w.session.location, w.session_id]
           end
      	end
          #send to browser
  	        send_data csv_string, :type =>'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=weighings.csv"
      end
    end
  end

  # GET /weighings/1
  # GET /weighings/1.json
  def show
    @weighing = Weighing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weighing }
    end
  end

  # GET /weighings/new
  # GET /weighings/new.json
  def new
    @weighing = Weighing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weighing }
      format.js
    end
  end

  # GET /weighings/1/edit
  def edit
    @weighing = Weighing.find(params[:id])
  end

  # POST /weighings
  # POST /weighings.json
  def create
    session_id = params[:weighing].delete(:session_id)
    @weighing = Weighing.new(params[:weighing])
    @weighing.session_id = session_id
  #For handling the subtraction of the last weight taken by the current weight with multiple sessions running simultaneously
    #if Weighing.where(["session_id = ?", @weighing.session_id]).count >= 1
      #@previous = Weighing.where(["session_id = ?", session_id]).last.t_weight.to_f
      #@weighing.weight = (@weighing.t_weight.to_f - @previous).to_f
      #@weighing.save
    #else
      #@weighing.weight = @weighing.t_weight
      #@weighing.save
    #end  
  #For different digital scale that records individual weight but not total   
    if Weighing.where(["session_id = ?", @weighing.session_id]).count >= 1
      @previous = Weighing.where(["session_id = ?", session_id]).last.t_weight.to_f
      @weighing.t_weight = (@weighing.weight.to_f + @previous).to_f
      @weighing.save
    else
      @weighing.t_weight = @weighing.weight
      @weighing.save
    end
    respond_to do |format|
      if @weighing.save
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weighings/1
  # PUT /weighings/1.json
  def update
    @weighing = Weighing.find(params[:id])

    respond_to do |format|
      if @weighing.update_attributes(params[:weighing])
        format.html { redirect_to @weighing, notice: 'Weighing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weighings/1
  # DELETE /weighings/1.json
  def destroy
    @weighing = Weighing.find(params[:id])
    @weighing.destroy

    respond_to do |format|
      format.html { redirect_to weighings_url }
      format.json { head :no_content }
    end
  end
end
