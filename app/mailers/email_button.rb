class EmailButton < ActionMailer::Base
  default from: "wubtesting@gmail.com"
  
  def send_list(list, email)
    @list = list
    @email = email
    mail(to: email, subject: 'Here is your list')
  end

end
