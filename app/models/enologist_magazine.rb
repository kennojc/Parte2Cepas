class EnologistMagazine < ApplicationRecord
  enum role: {editor: 0, writer: 1, reviewer:2 }
  belongs_to :enologist, optional: true
  belongs_to :magazine, optional: true
  
end
