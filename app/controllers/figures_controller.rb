class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])

    params[:figure][:landmark_ids].each do |landmark_id|
      @figure.add_landmark(Landmark.find(landmark_id))
    end

    params[:figure][:title_ids].each do |title_id|
      @figure.add_title(Title.find(title_id))
    end

    @figure.save
    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures/:id' do
    figure=Figure.find(params[:id])
    figure.update(params[:figure])
    redirect to "figures/#{figure.id}"
  end
end
