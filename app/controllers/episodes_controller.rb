class EpisodesController < ApplicationController

    def index
        episodes = Episode.all
        render json: episodes.to_json(only: [:id, :date, :number]), status: :ok
    end

    def show
        episode = find_episode
        render json: episode, status: :ok
    end

    def destroy
        episode = find_episode
        episode.destroy
        head :no_content
    end

    private

    def find_episode
        Episode.find(params[:id])
    end

end
