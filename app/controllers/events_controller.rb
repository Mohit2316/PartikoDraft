class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    puts "event parameters are"
    id = event_params['club_id'].split('/').last
    @oauth = Koala::Facebook::OAuth.new('345625378972716','8d652b113a8cf8385b975a5ae77debf6', "http://www.partiko.com/")
    @graph = Koala::Facebook::API.new(@oauth.get_app_access_token)
    eventInfo = @graph.get_object(id, {}, api_version: "v2.0")
    pic = @graph.get_connections(id,"?fields=cover")
    puts pic
    location = eventInfo['venue']['city']
    timings = eventInfo['start_time']
    
    event = {:name => eventInfo['name'],:location => location, :picture => pic['cover']['source'] ,:description => eventInfo['description'], :timings =>timings, :club_id => eventInfo['owner']['name']}
    @event = Event.new(event)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :location, :picture, :description, :timings, :club_id, :facebookUrl)
    end
end
