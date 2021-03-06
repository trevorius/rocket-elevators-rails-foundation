class InterventionsController < InheritedResources::Base
  before_action :set_quote, only: [:show, :edit, :update, :destroy]


  def create
    p params
    p intervention_params
    @intervention = Intervention.new(intervention_params)
    
    
    respond_to do |format|

      if @intervention.save

        pp @intervention

        # format.html {  redirect_to root_path , notice: "Save process completed!" }
        format.html {  flash.now[:notice]="Save process completed!" }

        format.json { render json: @intervention, status: :created, location: @intervention }
        
       
      else
        format.html { 
            flash.now[:notice]="Save proccess coudn't be completed!" 
            render :new 
        }
        format.json { render json: @intervention.errors, status: :unprocessable_entity}
      end
    end
  end
  

  private

    def intervention_params
      params.require(:interventions).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date, :end_date, :result, :report, :status)
    end

end
