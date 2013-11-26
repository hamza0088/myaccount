module KnowsTheDomain
  def webaccount
    @webaccount ||= Myaccount.new(accountid)
  end
  def esi_ws
    @esi_ws ||= Webservice.new()
  end
  def account_history_page
    @account_history_page ||= Customeraccounthistory.new(accountid, browser)
  end
end #module
World(KnowsTheDomain)