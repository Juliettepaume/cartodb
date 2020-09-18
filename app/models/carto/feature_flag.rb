module Carto
  class FeatureFlag < ActiveRecord::Base

    validates :name, presence: true

    has_many :feature_flags_user, dependent: :destroy
    has_many :users, through: :feature_flags_user

    scope :restricted, -> { where(restricted: true) }
    scope :not_restricted, -> { where(restricted: false) }

    def self.allowed?(name)
      restricted.exists?(name: name)
    end
  end
end
