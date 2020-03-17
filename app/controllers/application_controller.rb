class ApplicationController < ActionController::Base
    def main_page
        render template: 'layouts/application'
    end
end
