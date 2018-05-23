class PersonPetExperimentController < ApplicationController
   include ViewHelper
   include GuessHelper

    def new
        @ppe = PersonPetExperiment.new
    end

    def show
        # Doesn't work | learning material is wrong ("[:id]") 
        # This works according to ruby doc
        @ppe = PersonPetExperiment.find(params[:id])
        @ppe.pet_kind = pet_kind(@ppe)
    end

    def guessvalidation
        @ppe = PersonPetExperiment.find(params[:id])
        @ppe.pass = params[:pass]
        @ppe.save
    end

    def goodbye
        @ppe = PersonPetExperiment.find(params[:id])
        catLink = "https://en.wikipedia.org/wiki/Kitten"
        dogLink = "https://en.wikipedia.org/wiki/Puppy"
        
        if @ppe.guess == 0
            if @ppe.pass 
                redirect_to dogLink
            else 
                redirect_to catLink
            end
        else
            if @ppe.pass 
                redirect_to catLink
            else 
                redirect_to dogLink
            end
        end
    end

    def create
        @ppe = PersonPetExperiment.new(ppe_params)    
        @ppe.guess = takeGuess
        @ppe.save
        # This works according to ruby doc
        redirect_to action: "show", id: @ppe.id
         # Doesn't work | learning material is wrong or different version
        #redirect_to @ppe  -- not working
    end

    private 
        def ppe_params
            params.require(:person_pet_experiment).permit(:height, :weight)
        end
end
