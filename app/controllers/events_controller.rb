class EventsController < ApplicationController
	def index
		events = params[:repo_id].present? ? GithubEvent.where(repo_id: params[:repo_id]) : GithubEvent.all
		render json: events, status: :ok
	end

	def show
		event = GithubEvent.find(params[:id])
		if event
			render json: event, status: :ok
		else
			render  json: { error: "No Event was found for id #{params[:id]}" }, status: :not_found
		end
	end

	def create
		event = GithubEvent.new(event_params.merge!(actor_id: @current_user.id))
		if event.save
			render json: event, status: :ok
		else
			render json: {error: "Unable to create github event"}, status: :bad_request
		end
	end

	private

	def event_params
		params.require(:event).permit(:event_type, :public, :repo_id)
	end
end