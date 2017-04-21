class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    redirect to "owners/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    erb :'/figures/show'
  end

  post '/figures/:id' do
    redirect to "figures/#{@figure.id}"
  end
end
