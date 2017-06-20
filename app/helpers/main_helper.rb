module MainHelper
  def random_noun
    ["man","mountain","state","ocean","country","building","cat","airline","wealth"," happiness","pride","fear","religion","bird","book","phone","rice","snow","water"].sample
  end
  def tidy_params params
    params.delete_if{|k,v| v.blank?}
  end
end
