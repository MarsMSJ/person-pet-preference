module ViewHelper
    def pet_kind(ppe) 
        if ppe.guess == 0
           return "Cat"
        else
            return "Dog"
        end
    end 
end