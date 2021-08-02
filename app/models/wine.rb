class Wine < ApplicationRecord
    has_many :wine_strains
    has_many :strains, through: :wine_strains, dependent: :destroy
    has_many :wine_enologists
    has_many :enologists, through: :wine_enologists, dependent: :destroy
    accepts_nested_attributes_for :strains, :wine_strains, :enologists, :wine_enologists,  reject_if: :all_blank, allow_destroy: true


    def recipe
        @percentages = Array.new
        self.wine_strains.each do |winestrain| 
            @percentages.push("#{winestrain.strain.name} " + "(#{winestrain.percentage}%)") 
        end
        @percentages.sort.join(', ')
    end

    def winescore
        @winescores = Array.new
        self.wine_enologists.each do |w|
            @winescores.push("#{w.enologist.name} " + "=#{w.score} puntos")
        end
        @winescores.sort.join(', ')
    end

end
