module ApplicationHelper

    def is_admin?
        return flash[:danger] = "Khong co quyen" if current_user.role != 1
    end
    
end
