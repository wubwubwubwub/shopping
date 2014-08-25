class EmailButton < ActionMailer::Base
  default from: "wubtesting@gmail.com"
  
  def send_list(list)
    @list = list
    @items = list.items
    mail(to: list.email, subject: 'Here is your list')
  end

end
