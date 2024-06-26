  # GET /articles or /articles.json
class ArticlesController < ApplicationController
  def index
    if params[:query].present?
      @articles = Article.search_by_title_and_content(params[:query])
      record_search(params[:query])
    else
      @articles = Article.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def record_search(query)
    user_identifier = request.remote_ip
    previous_query = SearchQuery.where(user_identifier: user_identifier).order(created_at: :desc).first

    if previous_query.nil? || !query.start_with?(previous_query.query)
      SearchQuery.create(query: query, ip_address: request.remote_ip, user_identifier: user_identifier)
    end
  end
end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end

