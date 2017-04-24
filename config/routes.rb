Rails.application.routes.draw do
  get("/flexible/square/5", {:controller => "calculations", :action => "flex_square_5"})
end
