class StatsController < ApplicationController
    
    def index
        @ppe = PersonPetExperiment.all;
    end
end