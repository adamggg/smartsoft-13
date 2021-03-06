class KeywordsController < BackendController
  # displays the form for adding a new word
  def new
    @keyword = Keyword.new(params[:name])
  end

  # Create action for keywords
  # Author:
  #   Mohamed Ashraf
  # @params:
  #   name: the name of the new keyword
  #   redirect: the url to redirect to after the creation defaults to new
  #             keyword path
  #   is_english: the language of the keyword
  # returns:
  #   success: refreshes the page and displays notification
  #   failure: refreshes the page with error displayed
  def create
    redirect_url = params[:redirect]
    if redirect_url.blank?
      redirect_url = search_path
    end
    name = params[:keyword][:name]
    is_english = params[:keyword][:is_english]
    success, @keyword = Keyword.add_keyword_to_database(name, false, is_english)
    if success
      flash = { :success => t(:keyword_added, keyword: @keyword.name) }
      redirect_to redirect_url, :flash => flash
    else
      flash = { :error => @keyword.errors.messages[:name] }
      redirect_to keywords_new_path, :flash => flash
    end
  end
end
