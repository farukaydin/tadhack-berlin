class CallsController
  def create
    Calls.new.send(from: params[:from], to: params[:to])
  end
end
