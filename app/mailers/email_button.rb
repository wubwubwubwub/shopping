class EmailButton < ActionMailer::Base
  default from: "wubtesting@gmail.com"
  
  def send_list(list, email, sender)
    @list = list
    @email = email
    @sender = sender
    mail(to: email, subject: 'Here is your list')
  end

end
