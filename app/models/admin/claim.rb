module Admin
  class Claim < ApplicationRecord
    self.table_name = :claims
    has_many :claim_claimants
    has_many :claim_respondents
    has_many :claim_representatives
    has_many :claim_uploaded_files
    has_many :claimants, through: :claim_claimants
    has_many :respondents, through: :claim_respondents
    has_many :representatives, through: :claim_representatives
    has_many :uploaded_files, through: :claim_uploaded_files

  end
end