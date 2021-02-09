class PostsController < ApplicationController
    http_basic_authenticate_with name: 'desafiovamoscontodo', password: 'XAHTJEAS23123%23', except: :index

    def index
        @posts= Post.all.order(created_at: :desc)
    end

    def new
        @post= Post.new
    end

    def create
        
    end
end