class StudyGroupSerializer < ActiveModel::Serializer
  # attributes :id
  # attributes *StudyGroup.column_names
  attributes :studyGroup, :sites
  def studyGroup
    object.name
  end
  def sites
    object.sites.map {|study| study.name.upcase}
  end
end
