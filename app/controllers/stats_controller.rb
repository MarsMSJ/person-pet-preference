class StatsController < ApplicationController
    def new
    end
    
    def index
        @ppe = PersonPetExperiment.all;
    end
end