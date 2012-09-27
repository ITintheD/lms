module Admin
  class StudentsController < AdminController
    
    def index
      @students = User.all
    end
    
  end
end
