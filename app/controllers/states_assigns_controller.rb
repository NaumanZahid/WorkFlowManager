class StatesAssignsController < ApplicationController
  before_action :set_states_assign, only: [:show, :edit, :update, :destroy]

  # GET /states
  # GET /states.json
  def index
    @states_assigns = StatesAssign.all
  end

  # GET /states/1
  # GET /states/1.json
  def show
  end

  # GET /states/new
  def new
    @states_assign = StatesAssign.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  # POST /states.json
  def create
    @states_assign = StatesAssign.new(states_assign_params)

    respond_to do |format|
      if @states_assign.save
        format.html { redirect_to @states_assign, notice: 'State was successfully created.' }
        format.json { render :show, status: :created, location: @states_assign }
        "#{@states_assign.assigned_to}StateMachine".constantize.state @states_assign.state.name.to_sym

        puts '##############################'
        puts  LeadStateMachine.states
        puts '##############################'

      else
        format.html { render :new }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      "#{@states_assign.assigned_to}StateMachine".constantize.states.delete(@states_assign.state.name)
      if @states_assign.update(states_assign_params)
        format.html { redirect_to @states_assign, notice: 'State was successfully updated.' }
        format.json { render :show, status: :ok, location: @states_assign }
        "#{@states_assign.assigned_to}StateMachine".constantize.state @states_assign.state.name.to_sym

        puts '##############################'
        puts  LeadStateMachine.states
        puts '##############################'

        puts '##############################'
        puts  PaymentStateMachine.states
        puts '##############################'


      else
        format.html { render :edit }
        format.json { render json: @states_assign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    "#{@states_assign.assigned_to}StateMachine".constantize.states.delete(@states_assign.state.name)
    @states_assign.destroy

    puts '##############################'
    puts  LeadStateMachine.states
    puts '##############################'

    respond_to do |format|
      format.html { redirect_to states_assigns_url, notice: 'State was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_states_assign
    @states_assign = StatesAssign.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def states_assign_params
    params.require(:states_assign).permit(:assigned_to, :state_id)
  end
end
