class ApplicationController < ActionController::Base
    #Paginacion pagy
    include Pagy::Backend

    protected
    # Con este metodo logramos que los roles funcionen correctamente segun lo
    # definido en los controladores correspondientes 
    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
            redirect_to engines_path, notice: "No estás autorizado para realizar esta acción"
        end
    end
    # Con este metodo logramos que al iniciar sesion se redirija al usuario a la ruta homes_index
    def after_sign_in_path_for(resource)
        homes_index_path
    end
end
