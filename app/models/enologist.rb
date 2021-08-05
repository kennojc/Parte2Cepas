class Enologist < ApplicationRecord
    has_many :enologist_magazines
    has_many :magazines, through: :enologist_magazines, dependent: :destroy
    has_many :wine_enologists
    has_many :wines, through: :wine_enologists, dependent: :destroy
    accepts_nested_attributes_for :enologist_magazines, :magazines, reject_if: :all_blank, allow_destroy: true


    def jobs
        @jobs = Array.new
        self.enologist_magazines.each do |e| 
            @jobs.push("#{e.magazine.name} " + "(#{e.role})") 
        end
        @jobs.sort.join(', ')
    end
end