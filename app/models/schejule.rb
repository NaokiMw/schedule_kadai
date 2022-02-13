class Schejule < ApplicationRecord
    validates :title, presence: true
    validates :startdate, presence: true
    validates :enddate, presence: true

    
    validate :After_today
    validate :After_the_start_date

    def After_today
        errors.add(:startdate, "開始日は今日以降のものを選択して下さい") unless 
        startdate.nil? || Date.today <= self.startdate
    end

    def After_the_start_date
        errors.add(:enddate, "終了日は開始日以降のものを選択してください") unless
        enddate.nil? || self.startdate <= self.enddate 
    end
end
