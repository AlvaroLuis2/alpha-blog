class ArticlesController < ApplicationController
    before_action :get_article, only: [:show, :edit, :update, :destroy]

    def index 
        @articles = Article.all
    end
    
    def show
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(get_params)
        if @article.save
            flash[:notice] = "Article was created succefully"
            redirect_to article_path(@article)
        else
            render :new, status: 402
        end

    end

    def update
        if @article.update(get_params)
            flash[:notice] = "Article was updated succesfully"
            redirect_to(@article)
        else
            render :edit, status: 402   
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path, status: 303
    end
    
    private

    def get_article
        @article = Article.find(params[:id])
    end

    def get_params
        params.require(:article).permit(:title, :description)
    end
end