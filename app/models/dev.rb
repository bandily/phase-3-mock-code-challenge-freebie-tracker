class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, though: :freebies

    def received_one?(item_name)
        if self.freebies.find_by(item_name: item_name) == nil
            false
        else 
            true
        end
    end

    def give_away(dev:, freebie:)
        freebie.dev_id = dev.id
        freebie.save
    end
end
