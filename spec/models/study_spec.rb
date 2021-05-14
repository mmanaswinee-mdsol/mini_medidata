require "rails_helper"
# study should have a name

describe Study, type: :model do
  context 'when study do not have a name' do
    it 'is invalid' do
      study =build(:study, name: '')
      expect(study.valid?).to eq false    
    end
  end

  context 'when study do not have age_limit greater than 7' do
    it 'is invalid' do
      study = build(:study, age_limit: 3)
      expect(study.valid?).to eq false    
    end
  end

  context 'when study do not have a drug' do
    it 'is invalid' do
      study = build(:study, drug: '')
      expect(study.valid?).to eq false    
    end
  end

  context 'when study do not have phase less than or equal to 5' do
    it 'is invalid' do
      study = build(:study, phase: 8 )
      expect(study.valid?).to eq false    
    end
  end

  context 'when study have name, age_limit, drug and phase' do
    it 'is valid' do
      study = build(:study, name: 'my_study', drug: 'dextromethorphan', age_limit: 10, phase:4)
      expect(study.valid?).to eq true   
    end
  end


end

describe '#usable_drugs' do
  before do
    create_list(:study,10, phase: 4)
    create_list(:study,20, phase: 3)
  end
  context 'when we call usable_drugs' do
    it 'returns drugs with phase 4 or greater than 4' do
      expect(Study.usable_drugs.count).to eq(10)
    end
  end
  context 'when we call under_trials' do
    it 'returns drugs with under phase 4' do
      expect(Study.under_trials.count).to eq(20)
    end
  end
end


    
