class Enologist < ApplicationRecord
    enum role: {Editor: 0, Writer: 1, Reviewer: 2}
    has_many :enologist_magazines
    has_many :magazines, through: :enologist_magazines, dependent: :destroy
    has_many :wine_enologists
    has_many :wines, through: :wine_enologists, dependent: :destroy
end