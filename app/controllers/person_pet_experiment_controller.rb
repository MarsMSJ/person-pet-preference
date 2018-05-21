module ViewHelper
    def pet_kind(ppe) 
        if ppe.guess == 0
           return "Cat"
        else
            return "Dog"
        end
    end 
end

class PersonPetExperimentController < ApplicationController
   include ViewHelper

    def new
        @person_pet_experiment = PersonPetExperiment.new
    end

    def show
        @person_pet_experiment = PersonPetExperiment.first
        @person_pet_experiment.pet_kind = pet_kind(@person_pet_experiment)
    end

    def create
        @person_pet_experiment = PersonPetExperiment.new(person_pet_experiment_params)

       #Simple chance for now
        @person_pet_experiment.guess = rand(1)
        @person_pet_experiment.save
        redirect_to show_path(@person_pet_experiment.id)
    end

    private 
        def person_pet_experiment_params
            params.require(:person_pet_experiment).permit(:height, :weight)
        end
end
