class Account
  attr_accessor :accountid, :service_address, :full_name, :telephone, :email
  attr_accessor :invoice_date, :invoice_total_charges, :due_date, :current_total_charge
  
  def initialize(accountid)
    @accountid = accountid
  end

end #class

class Myaccount < Account
  #capture all interested information on web page to MyAccount_Web instance.
  #this is mock class for now
  def account_number(id)
    return @accountid = id
  end
    
  def invoice_date(invoicedate)
    return @invoice_date = invoicedate
  end
    
  def invoice_total_charges(charges)
    return @invoice_total_charges = charges
  end
    
  def due_date(duedate)
    return @due_date = duedate                  #this is the mock data
  end
    
  def current_total_charges(charge)
    returned @current_total_charge = charge     #this is the mock data
  end
    
end #class
  
class Myaccountesb < Account
  #capture all interested information on web page to MyAccount_Web instance.
  #this is mock class for now
  def account_number(id)
    return @accountid = id
  end
    
  def invoice_date(invoicedate)
    return @invoice_date = invoicedate
  end
    
  def invoice_total_charges(charges)
    return @invoice_total_charges = charges
  end
    
  def due_date(duedate)
    return @due_date = duedate                  #this is the mock data
  end
    
  def current_total_charges(charge)
    returned @current_total_charge = charge     #this is the mock data
  end
    
end #class


