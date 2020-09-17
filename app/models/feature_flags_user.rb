class FeatureFlagsUser < Sequel::Model
  include CartoDB::MiniSequel

  many_to_one :user

  def feature_flag
    Carto::FeatureFlag.find(feature_flag_id)
  end
end
