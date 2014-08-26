class EmailButton < ActionMailer::Base
  default from: "wubtesting@gmail.com"
  
  def send_list(list, email, sender)
    @list = list
    @email = email
    @sender = sender
    mail(to: email, subject: "#{@sender.capitalize} sent you a shopping list!")
  end

end
