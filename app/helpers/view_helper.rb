module ViewHelper
    def pet_kind(ppe) 
        if ppe.guess == 0
           return "Cat"
        else
            return "Dog"
        end
    end 

    def guess_result(ppe)
        #Missing value - Error
        if ppe.pass.nil?
            return "Error"
        end

        if ppe.pass
            return "Correct" 
        else 
            return "Wrong"            
        end 
    end

    def guess_validation(ppe)
         #Missing value - Error
        if ppe.pass.nil?
            return "Sorry, something went wrong... :(" 
        end

        if ppe.pass
            return "We got it right?! YAY!"
        else 
            return "Oops! I'll work on that!"       
        end 
    end
end