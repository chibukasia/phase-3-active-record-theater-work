class Role < ActiveRecord::Base 
    has_many :auditions

    def actors
        @actors_list = []
        self.auditions.each do |audition|
            @actors_list << audition.name
        end
        actors_list
    end

    def locations
        @location_list = []
        self.auditions.each do |audition|
            @location_list << audition.location
        end
        @location_list
    end

    def self.lead
        self.first
    end

    def self.understudy
          
        second_instance =if self.second == nil
                            "no actor has been hired for understudy for this role"
                        else 
                            self.second
                        end
        second_instance
    end
end