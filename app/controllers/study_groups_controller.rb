class StudyGroupsController < ApplicationController
 def index
    @sg=StudyGroup.all
    render json:@sg

 end
end 