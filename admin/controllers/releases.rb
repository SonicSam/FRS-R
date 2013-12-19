FrsR::Admin.controllers :releases do
  get :index do
    @title = "Releases"
    @releases = Release.all
    render 'releases/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'release')
    @release = Release.new
    render 'releases/new'
  end

  post :create do
    @release = Release.new(params[:release])
    if @release.save
      @title = pat(:create_title, :model => "release #{@release.id}")
      flash[:success] = pat(:create_success, :model => 'Release')
      params[:save_and_continue] ? redirect(url(:releases, :index)) : redirect(url(:releases, :edit, :id => @release.id))
    else
      @title = pat(:create_title, :model => 'release')
      flash.now[:error] = pat(:create_error, :model => 'release')
      render 'releases/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "release #{params[:id]}")
    @release = Release.find(params[:id])
    if @release
      render 'releases/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'release', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "release #{params[:id]}")
    @release = Release.find(params[:id])
    if @release
      if @release.update_attributes(params[:release])
        flash[:success] = pat(:update_success, :model => 'Release', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:releases, :index)) :
          redirect(url(:releases, :edit, :id => @release.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'release')
        render 'releases/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'release', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Releases"
    release = Release.find(params[:id])
    if release
      if release.destroy
        flash[:success] = pat(:delete_success, :model => 'Release', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'release')
      end
      redirect url(:releases, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'release', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Releases"
    unless params[:release_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'release')
      redirect(url(:releases, :index))
    end
    ids = params[:release_ids].split(',').map(&:strip)
    releases = Release.find(ids)
    
    if releases.each(&:destroy)
    
      flash[:success] = pat(:destroy_many_success, :model => 'Releases', :ids => "#{ids.to_sentence}")
    end
    redirect url(:releases, :index)
  end
end
