class Enologist < ApplicationRecord
    has_many :enologist_magazines
    has_many :magazines, through: :enologist_magazines, dependent: :destroy
    has_many :wine_enologists
    has_many :wines, through: :wine_enologists, dependent: :destroy
end
