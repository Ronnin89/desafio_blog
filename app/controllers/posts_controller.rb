class PostsController < ApplicationController
    http_basic_authenticate_with name: 'desafiovamoscontodo', password: 'XAHTJEAS23123%23', except: :index

    def index
        @posts= Post.all.order(created_at: :desc)
    end

    def new
        @post= Post.new
    end

    
    def create
        @post = Post.new(post_params)
        if @post.content.include?("spoiler")
            content = @post.content.split(" ")
            content.delete("spoiler")
            content = content.join(" ")
            @post.content = content
        end
        if @post.save
            redirect_to root_path, notice: 'Se ha creado el post'
        else
            redirect_to posts_dashboard_path, alert: 'No se pudo crear el post, es necesario tener todos los campos con contenido'
        end

    end
   

    private

    def post_params
        params.require(:post).permit(:title, :content, :image_url)
      end
end