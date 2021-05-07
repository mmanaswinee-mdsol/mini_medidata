require "rails_helper"
require "spec_helper"


RSpec.describe StudiesController do

   describe '#create' do
        context 'when study created successfully' do
            before do
                @sg=StudyGroup.create(name: "study_group1")
            end 
            let(:study_parameters) do
                {
                    name: 'abc',
                    age_limit: 30,
                    drug: 'pqr',
                    phase: 1
                }

            end
          
            it 'returns success message' do
                post :create, params: {study: study_parameters, study_group_id: @sg.id }
                expect(response.status).to eq(200)
                expect(response.body).to eq ("{\"notice\":\"Study created succesfully!!\"}")
            end
        end

        context 'when study did not create' do
            before do
                @sg=StudyGroup.create(name: "study_group1")
            end 
            
            let(:study_parameters) do
                {
                    name: '',
                    age_limit: 30,
                    drug: 'pqr',
                    phase: 0
                }
            end

            it 'returns success message' do
                post :create, params: { study: study_parameters, study_group_id: @sg.id }
                expect(response.status).to eq(200)
                expect(response.body).to eq ("{\"notice\":\"Could not create study!!\"}")
                
            end
        end
    end

    describe '#index' do
        context 'when it displays all the studies present inside study group' do
            before do
                @sg=StudyGroup.create(name: "study_group1")
            end 
        let!(:studies) { create_list(:study, 5, study_group_id: @sg.id) }
        it 'returns all the studies' do
          get :index, params: { study_group_id: @sg.id, format: 'json'}
    
          studies = JSON.parse(response.body)

          expect(studies.count).to eq 5
        end
      end
    end
    describe '#destroy' do
        context 'when study deleted successfully' do
            before do
                @sg=StudyGroup.create(name: "study_group1")
            end 
            let!(:study) { create(:study, study_group_id: @sg.id) }
            it 'returns success message' do
                delete :destroy, id: @study.id
                byebug
                expect(response.status).to eq(200)
                expect(response.body).to eq ("{\"notice\":\"Study deleted succesfully!!\"}")
            end
        end
    end
    
end