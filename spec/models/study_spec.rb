require "rails_helper"
# study should have a name

describe Study, type: :model do
  context 'when study do not have a name' do
    it 'is invalid' do
      study = Study.new(name: '')
      expect(study.valid?).to eq false    
    end
  end

  context 'when study do not have age_limit greater than 7' do
    it 'is invalid' do
      study = Study.new(age_limit: 3)
      expect(study.valid?).to eq false    
    end
  end

  context 'when study do not have a drug' do
    it 'is invalid' do
      study = Study.new(drug: '')
      expect(study.valid?).to eq false    
    end
  end

  context 'when study do not have phase less than or equal to 5' do
    it 'is invalid' do
      study = Study.new(phase: 8)
      expect(study.valid?).to eq false    
    end
  end

  context 'when study have name, age_limit, drug and phase' do
    it 'is valid' do
      study = Study.new(name: 'my_study', drug: 'dextromethorphan', age_limit: 10, phase:4)
      expect(study.valid?).to eq true   
    end
  end

end
