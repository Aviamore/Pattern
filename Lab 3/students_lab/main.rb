require_relative 'student_model/student'
require_relative 'student_model/student_short'
require_relative 'student_list_models/data_list_model/data_table'
require_relative 'views/window'



app = FXApp.new
Window.new(app)
app.create
app.run






