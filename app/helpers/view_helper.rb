module ViewHelper
    def pet_kind(ppe) 
        if ppe.guess == 0
           return "Cat"
        else
            return "Dog"
        end
    end 

    def guess_result(ppe)
        if !ppe.pass 
            return "Incomplete"
        elseif ppe.pass == 1
            return "Correct"
        else 
            return "Wrong"
        end
    end
end