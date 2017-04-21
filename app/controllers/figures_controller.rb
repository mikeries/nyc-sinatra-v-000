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

    if params[:figure]
      if params[:figure][:landmark_ids]
        params[:figure][:landmark_ids].each do |landmark_id|
          @figure.add_landmark(Landmark.find(landmark_id))
        end
      end

      if params[:figure][:title_ids]
        params[:figure][:title_ids].each do |title_id|
          @figure.add_title(Title.find(title_id))
        end
      end
    end

    if !params[:title].empty?
      @figure.titles.build(name: params[:title][:name])
    end

    if !params[:landmark].empty?
      @figure.landmarks.build(name: params[:landmark][:name])
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
