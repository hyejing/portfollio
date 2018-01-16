class BoardController < ApplicationController
  def index
        @boards = Board.all.reverse
    end
    
    def new
        
    end
    
    def create
        @title = params[:title]
        @content = params[:content]
        @user = params[:user]
        @password = params[:password]
        
        board = Board.new
        board.title = @title
        board.content = @content
        board.user = @user
        board.password = @password
        board.save
        redirect_to "/board/index"
    end
    
    def show
        @board = Board.find(params[:id])
    end
    
    def edit
        @board = Board.find(params[:id])
    end
    
    def update
        @title = params[:title]
        @content = params[:content]
        board = Board.find(params[:id])
        board.title = @title
        board.content = @content
        board.save
        
        redirect_to "/board/"+params[:id]+"/show"
    end
    
    def delete
        Board.find(params[:id]).destroy
        
        redirect_to "/board/index"
    end
    
    
end
