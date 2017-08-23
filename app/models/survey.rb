class Survey < ApplicationRecord
    has_many :options, inverse_of: :survey
    accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

end
