class ClerksController < ApplicationController
  def new
    render "/users/new", locals: { user: user }
  end
end
