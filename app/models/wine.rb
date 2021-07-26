class Wine < ApplicationRecord
    has_many :wine_strains
    has_many :strains, through: :wine_strains, dependent: :destroy
    has_many :wine_enologists
    has_many :enologists, through: :wine_enologists, dependent: :destroy
    accepts_nested_attributes_for :strains, :wine_strains, :wine_enologists, :enologists, reject_if: :all_blank, allow_destroy: true


    def recipe
        @percentages = Array.new
        self.wine_strains.each do |winestrain| 
            @percentages.push("#{winestrain.strain.name} " + "(#{winestrain.percentage}%)") 
        end
        @percentages.sort.join(', ')
    end

end
