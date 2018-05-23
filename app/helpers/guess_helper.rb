module GuessHelper
    # Constants
    cat = 0
    dog = 1
    #filters
    # System guess incorrectly that the person prefers dogs
    MislabeledCatLovers = "guess = 1 AND pass = false"

    # System guess correctly the person prefers cats
    SpottedCatLovers = "guess = 0 AND pass = true"

    # System guess correctly the person prefers dogs        
    SpottedDogLovers = "guess = 1 AND pass = true"
       
    # System guess incorrectly that the person prefers cats
    MislabeledDogLovers = "guess = 0 AND pass = false" 

    # Query the number of Dog Lovers
    
    def generalQuery( subQueryA, subQueryB )
        return PersonPetExperiment.count( subQueryA ) + PersonPetExperiment.count( subQueryB )
    end

    define_method :queryDogLovers do |filterHeightWeight|
        filterSpotted = SpottedDogLovers + filterHeightWeight
        filterMislabeled = MislabeledDogLovers + filterHeightWeight
        return generalQuery( filterMislabeled, filterSpotted )      
    end

    # Query the number of Cat Lovers
    define_method :queryCatLovers do |filterHeightWeight|           
        filterSpotted = SpottedCatLovers + filterHeightWeight
        filterMislabeled = MislabeledCatLovers + filterHeightWeight
        return generalQuery( filterMislabeled, filterSpotted ) 
    end

    def computePercentDifference( numA, numB )
        diff = (numA - numB).abs
        avg = (numA + numB) / 2
        return diff / avg
    end

    # Do we have enough data to guess?
    def isThereEnoughDataToGuess
        return PersonPetExperiment.count() > 10
    end

    # Just a simple (bad) random guess
    # used define_method to use constants
    define_method :simpleGuess do
        catsWin = SecureRandom.random_number(10)
        dogsWin = SecureRandom.random_number(10)
        return catsWin > dogsWin ? cat : dog
    end

    # Complicated Guess
    define_method :complexGuess do |filterHeightWeight|
        catLoverTotal = queryCatLovers(filterHeightWeight)
        dogLoverTotal = queryDogLovers(filterHeightWeight)
        percentDiff = computePercentDifference(catLoverTotal, dogLoverTotal)
        
        if percentDiff < 0.05
            return simpleGuess
        else
            puts( "cat lover total: ", catLoverTotal)
            puts( "dog lover total: ", dogLoverTotal)
            return catLoverTotal > dogLoverTotal ? cat : dog
        end
    end

    # Guess 
    def takeGuess(height, weight)
        if isThereEnoughDataToGuess  
            #Create filter for height and weight
            filterHeightWeight = " AND height = " + height.to_s + " AND weight = " + weight.to_s        
            return complexGuess(filterHeightWeight)
        else
            return simpleGuess
        end
    end
end