class StudiesController < ApplicationController
     skip_before_action :verify_authenticity_token
    # after_action :demo_after_action, only: [:index]
    #   around_action :demo_around_action

    # before_action :find_study_group, only: [:index, :create]
    
    # def create
    #     @study = @study_group.studies.new(study_params)
    #     if @study.save
    #         render json: {notice: "Study created succesfully!!"}
    #     else
    #         render json: {notice: "Could not create study!!"}            
    #     end
    # end

    # def index
    #     # puts "index method called"
    #     @studies= @study_group.studies
    #     render json: @studies
    # end
    def new
        @study=Study.new
        
    end


    def create
        @study = Study.new(study_params)
        if @study.save
            # StudyMailer.with( study: @study ).success_email.deliver_later
            redirect_to studies_path
        else
            render :new           
        end
    end

    def index
        # puts "index method called"
        @studies= Study.all
        # render json: @studies
    end

    def update
        @study=Study.find(params[:id])
        if @study
            @study.update(study_params)
            redirect_to studies_path
            # render json: {notice: "Study updated successfully"}
        else
            render :new           
            # render json: {error: "Could not find study"}
        end
    end

    def destroy
        @study=Study.find(params[:id])
        if @study
            @study.destroy
            redirect_to studies_path
            # render json: {notice: "Study deleted successfully"}
        else
            render :new           
            # render json: {error: "Could not find study"}
        end
    end
    private

    def find_study_group
        @study_group = StudyGroup.find(params[:study_group_id])
        # byebug
        puts @study_group
      end

    def demo_after_action
        p "called after method"
    end

    def demo_around_action
        p "called at the beginning method"
        yield
        p "called after method"
    end

    def study_params
        params.require(:study).permit(:name,:age_limit,:drug,:phase,:study_group_id,:my_image)
    end
end