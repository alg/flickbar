class WatchesController < ApplicationController

#  before_filter :authenticate_user!

  def create

    @movie = Movie.find_or_create(params[:title])
    @watch = @movie.watches.build(:user_id => current_user.id)

    if @watch.save
      respond_to do |f|
        f.html {
          flash[:notice] = "Successfully added \"#{@watch.movie.title}\" to your list" 
          redirect_to user_path(current_user.nickname)
        }
      end
    else
      respond_to do |f|
        f.html {
          flash[:error] = 'Error: ' + @watch.errors.full_messages.join(' ')
          redirect_to user_path(current_user.nickname)
        }
      end
    end


  end

  def destroy
    watch = current_user.watches.find(params[:id])

    if watch.destroy
      flash[:notice] = 'Successfully removed movie from your watch list'
      redirect_to :back
    end
  end

end
