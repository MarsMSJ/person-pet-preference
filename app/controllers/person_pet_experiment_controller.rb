class PersonPetExperimentController < ApplicationController
   include ViewHelper

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
       #Simple chance for now
        @ppe.guess = rand() % 2

        #Guess

        # Count the number of people (h*w) that prefer dogs
        
        # System guess correctly the person prefers dogs        
        dogLoverCount = PersonPetExperiment.count("guess = 1 AND pass = 1")
       
        # System guess incorrectly that the person prefers cats
        dogLoverCount+= PersonPetExperiment.count("guess = 0 AND pass = 0" )
        
         # System guess correctly the person prefers cats
        catLoverCount = PersonPetExperiment.count("guess = 0 AND pass = 1")
       
        # System guess incorrectly that the person prefers dogs
        catLoverCount+= PersonPetExperiment.count("guess = 1 AND pass = 0")
        
        #Compute % difference from lowest to highest
        low  = catLoverCount > dogLoverCount ? catLoverCount : dogLoverCount
        high  = catLoverCount > dogLoverCount ? dogLoverCount : catLoverCount
        diff = high - low
        diffPercent = ( diff / low ) * 100
        puts( catLoverCount, dogLoverCount )
        if diff == 0 || diff < 2
            puts("Random Guess", diff)
            @ppe.guess = rand() % 2 #Just a bad random guess
        else
            #Guess based on the more popular result
            puts("Majority Guess")
            @ppe.guess = catLoverCount > dogLoverCount ? 0 : 1
        end
        
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
