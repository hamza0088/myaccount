class Webservice
  #SOAP error
  attr_accessor :error1, :error2, :error3
  #customerAccountBillService_FindCustomerAccountBillDocument
  attr_accessor :accountid
  attr_accessor :amount_node, :billdate_node, :documentlocation_node
  #customerAccountFinancialEventService_FindCustomerAccountFinancialEvent
  attr_accessor :creationdate_node, :ratedescription_node
  #preferenceService_FindAccountPreference
  attr_accessor :characteristicid_node, :characteristicname_node
  #addressService11_FindServiceAddress(using americanpropertyaddressproperties, formattedaddressline1 & 2 only)
  #addressService11_FindGeographicAddress(using americanpropertyaddressproperties, formattedaddressline1 & 2, locality, StateOrProvince, Country, Postcode)
  #contactService_FindContact(using americanpropertyaddressproperties, formattedaddressline1 & 2 only)
  attr_accessor :americanpropertyaddressproperties_node, :formattedname_node, :formattedaddressline1_node, :formattedaddressline2_node, :locality_node, :stateorprovince_node, :country_node, :postcode_node, :startdatetime_node, :enddatetime_node
  #contactService_FindContact
  attr_accessor :telephonenumber_node, :email_node
  #billingService_ReadBillingCycle
  attr_accessor :billingperiodid_node, :billingperiodname_node, :billperioddescription_node
  
  #  def initialize(accountid)
  #    @accountid = accountid
  #  end

  def currentSystemTime
    time = Time.new
    #2013-09-11T21:32:51
    return time.strftime("%Y-%m-%dT%H:%M:%S")
  end

  def dateFrom_To(days)
    #format: "2013-10-10".
    today = Date.today
    puts (today - days.to_i).to_s
    return (Date.today - days.to_i).to_s
  end

  def saveESIResponse(xml_doc, accountID, service)
    # make directory if it doesn't exist
    Dir.mkdir("/temp") unless File.exists?("/temp")
    Dir.chdir("/temp")
    f = File.new(accountID + service + "_ws_response.xml", File::CREAT|File::TRUNC|File::RDWR, 0644)
    f << xml_doc
    f.close
  end

  def logESIResponse_2nodes(node1, node2, accountID, service)
    Dir.mkdir("/temp") unless File.exists?("/temp")
    Dir.chdir("/temp")
    f = File.new(accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
    f << "The test is executed at " + self.currentSystemTime + "\n"
    f << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
    #p node1.size
    begin
      0.upto(node1.size-1) { |number| p node1[number].text + "      " + node2[number].text}
      0.upto(node1.size-1) { |number| f << node1[number].text + "     " + node2[number].text + "\n"}
    rescue Exception => ex
      error_log = File.new("error_" + accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
      error_log << "The test is executed at " + self.currentSystemTime + "\n"
      error_log << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
      # Now "ex" is the name of the Exception. And "ex.inspect" inspects it.
      puts "Something went wrong, #{ex.inspect}, .."
      puts "No file created!"
      error_log << "Please verify the following causes: "
      error_log << "        " + @error1.inspect + "\n"
      error_log << "        " + @error2.inspect + "\n"
      error_log.flush
      error_log.close
    end
    f.flush
    f.close
  end

  def logESIResponse_3nodes(node1, node2, node3, accountID, service)
    Dir.mkdir("/temp") unless File.exists?("/temp")
    Dir.chdir("/temp")
    f = File.new(accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
    f << "The test is executed at " + self.currentSystemTime + "\n"
    f << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
    begin
      0.upto(node1.size-1) { |number| p node1[number].text + "      " + node2[number].text + "      " + node3[number].text}
      0.upto(node1.size-1) { |number| f << node1[number].text + "     " + node2[number].text + "      " + node3[number].text + "\n"}
    rescue Exception => ex
      error_log = File.new("error_" + accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
      error_log << "The test is executed at " + self.currentSystemTime + "\n"
      error_log << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
      # Now "ex" is the name of the Exception. And "ex.inspect" inspects it.
      puts "Something went wrong, #{ex.inspect}, .."
      puts "No file created!"
      error_log << "Please verify the following causes: "
      error_log << "        " + @error1.inspect + "\n"
      error_log << "        " + @error2.inspect + "\n"
      error_log.flush
      error_log.close
      #raise
    end
    f.flush
    f.close
  end

  def logESIResponse_4nodes(node1, node2, node3, node4, accountID, service)
    Dir.mkdir("/temp") unless File.exists?("/temp")
    Dir.chdir("/temp")
    f = File.new(accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
    f << "The test is executed at " + self.currentSystemTime + "\n"
    f << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
    begin
      #0.upto(node1.size-1) { |number| p node1[number].text + "      " + node2[number].text + "      " + node3[number].text + "      " + node4[number].text}
      0.upto(node1.size-1) { |number| p node1[number].text}
      0.upto(node2.size-1) { |number| p node2[number].text}
      0.upto(node3.size-1) { |number| p node3[number].text}
      0.upto(node4.size-1) { |number| p node4[number].text}

      #0.upto(node1.size-1) { |number| f << node1[number].text + "     " + node2[number].text + "      " + node3[number].text + "      " + node3[number].text + "\n"}
      0.upto(node1.size-1) { |number| f << node1[number].text + "\n"}
      0.upto(node2.size-1) { |number| f << node2[number].text + "\n"}
      0.upto(node3.size-1) { |number| f << node3[number].text + "\n"}
      0.upto(node4.size-1) { |number| f << node4[number].text + "\n"}
    rescue Exception => ex
      error_log = File.new("error_" + accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
      error_log << "The test is executed at " + self.currentSystemTime + "\n"
      error_log << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
      # Now "ex" is the name of the Exception. And "ex.inspect" inspects it.
      puts "Something went wrong on SOAP, #{ex.inspect}, .."
      puts "No file created!"
      error_log << "Please verify the following causes: "
      error_log << "        " + @error1.inspect + "\n"
      error_log << "        " + @error2.inspect + "\n"
      error_log.flush
      error_log.close
      #raise
    end
    f.flush
    f.close
  end

  def logESIResponse_5nodes(node1, node2, node3, node4, node5, accountID, service)
    Dir.mkdir("/temp") unless File.exists?("/temp")
    Dir.chdir("/temp")
    f = File.new(accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
    f << "The test is executed at " + self.currentSystemTime + "\n"
    f << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
    begin
      #0.upto(node1.size-1) { |number| p node1[number].text + "      " + node2[number].text + "      " + node3[number].text + "      " + node4[number].text}
      0.upto(node1.size-1) { |number| p node1[number].text}
      0.upto(node2.size-1) { |number| p node2[number].text}
      0.upto(node3.size-1) { |number| p node3[number].text}
      0.upto(node4.size-1) { |number| p node4[number].text}
      0.upto(node5.size-1) { |number| p node5[number].text}

      #0.upto(node1.size-1) { |number| f << node1[number].text + "     " + node2[number].text + "      " + node3[number].text + "      " + node3[number].text + "\n"}
      0.upto(node1.size-1) { |number| f << node1[number].text + "\n"}
      0.upto(node2.size-1) { |number| f << node2[number].text + "\n"}
      0.upto(node3.size-1) { |number| f << node3[number].text + "\n"}
      0.upto(node4.size-1) { |number| f << node4[number].text + "\n"}
      0.upto(node5.size-1) { |number| f << node5[number].text + "\n"}

    rescue Exception => ex
      error_log = File.new("error_" + accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
      error_log << "The test is executed at " + self.currentSystemTime + "\n"
      error_log << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
      # Now "ex" is the name of the Exception. And "ex.inspect" inspects it.
      puts "Something went wrong on SOAP, #{ex.inspect}, .."
      puts "No file created!"
      error_log << "Please verify the following causes: "
      error_log << "        " + @error1.inspect + "\n"
      error_log << "        " + @error2.inspect + "\n"
      error_log.flush
      error_log.close
      #raise
    end
    f.flush
    f.close
  end

  def logESIResponse_6nodes(node1, node2, node3, node4, node5, node6, accountID, service)
    Dir.mkdir("/temp") unless File.exists?("/temp")
    Dir.chdir("/temp")
    f = File.new(accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
    f << "The test is executed at " + self.currentSystemTime + "\n"
    f << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
    begin
      #0.upto(node1.size-1) { |number| p node1[number].text + "      " + node2[number].text + "      " + node3[number].text + "      " + node4[number].text}
      0.upto(node1.size-1) { |number| p node1[number].text}
      0.upto(node2.size-1) { |number| p node2[number].text}
      0.upto(node3.size-1) { |number| p node3[number].text}
      0.upto(node4.size-1) { |number| p node4[number].text}
      0.upto(node5.size-1) { |number| p node5[number].text}
      0.upto(node6.size-1) { |number| p node6[number].text}

      #0.upto(node1.size-1) { |number| f << node1[number].text + "     " + node2[number].text + "      " + node3[number].text + "      " + node3[number].text + "\n"}
      0.upto(node1.size-1) { |number| f << node1[number].text + "\n"}
      0.upto(node2.size-1) { |number| f << node2[number].text + "\n"}
      0.upto(node3.size-1) { |number| f << node3[number].text + "\n"}
      0.upto(node4.size-1) { |number| f << node4[number].text + "\n"}
      0.upto(node5.size-1) { |number| f << node5[number].text + "\n"}
      0.upto(node6.size-1) { |number| f << node6[number].text + "\n"}

    rescue Exception => ex
      error_log = File.new("error_" + accountID + service + "_ws_response.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
      error_log << "The test is executed at " + self.currentSystemTime + "\n"
      error_log << "This is ESI end point for " + service + " with account ID " + accountID.to_s + "\n"
      # Now "ex" is the name of the Exception. And "ex.inspect" inspects it.
      puts "Something went wrong on SOAP, #{ex.inspect}, .."
      puts "No file created!"
      error_log << "Please verify the following causes: " + "\n"
      error_log << "        error1 is: " + @error1.inspect + "\n"
      error_log << "        error2 is: " + @error2.inspect + "\n"
      error_log << "        error3 is: " + @error3.inspect + "\n"
      error_log.flush
      error_log.close
      #raise
    end
    f.flush
    f.close
  end

  def customerAccountBillService_FindCustomerAccountBillDocument(accountId, days_from, days_to,accountbill_url)
    namespaces = {
      "xmlns:v1" => "http://www.shaw.ca/ns/schema/shared/v1",
      "xmlns:v11" => "http://www.shaw.ca/ns/schema/customer/v1"
    }

    client = Savon.client do
      wsdl  accountbill_url
      env_namespace :soapenv
      namespace_identifier :v11
      namespaces namespaces
    end

    puts client.operations
    time = self.currentSystemTime
    datefrom = self.dateFrom_To(days_from)
    dateto = self.dateFrom_To(days_to)
    response = client.call(:find_customer_account_bill_document) do
      soap_header  "v1:MessageHeader" =>     
        {"v1:CreatedDatetime" => time}

      message   "v11:CustomerAccountBillListing" => 
        { "v11:AccountId" => accountId.to_s,
        "v11:DateFilter" => 
          { "v11:DateFrom" => datefrom,
          "v11:DateTo" => dateto,
          :order! => ["v11:DateFrom", "v11:DateTo"]
        },
        "v11:MaximumRecords" => "6",
        :order! => ["v11:AccountId", "v11:DateFilter", "v11:MaximumRecords"]
      } 
    end

    puts
    puts "This is ESI endpint for customerAccountBillService...for account ID " + accountId.to_s
    @amount_node = response.xpath("//ns0:Amount", 'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
    @billdate_node = response.xpath('//ns0:BillDate','ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
    @documentlocation_node = response.xpath('//ns0:DocumentLocation', 'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")

    xml_result = response.to_xml
    xml_doc  = Nokogiri::XML(xml_result)

    # Result as a file
    self.saveESIResponse(xml_doc, accountId, "_Customer_Find_Account_Bill_Document")
    self.logESIResponse_3nodes(@amount_node, @billdate_node, @documentlocation_node, accountId, "_Customer_Find_Account_Bill_Document")
  end

  def customerAccountFinancialEventService_FindCustomerAccountFinancialEvent(accountId, days_from, days_to, accountfinancialevent_url)
    namespaces = {
      "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      "xmlns:v1" => "http://www.shaw.ca/ns/schema/shared/v1",
      "xmlns:v11" => "http://www.shaw.ca/ns/schema/customer/v1"
    }

    client = Savon.client do
      wsdl accountfinancialevent_url
      env_namespace :soap
      namespace_identifier :v11
      namespaces namespaces
    end

    puts client.operations
    time = self.currentSystemTime
    datefrom = self.dateFrom_To(days_from)
    dateto = self.dateFrom_To(days_to)

    response = client.call(:find_customer_account_financial_event) do
      soap_header  "v1:MessageHeader" =>
        {"v1:CreatedDatetime" => time}

      message   "v11:CustomerAccountFinancialEventListing" =>
        { "v11:AccountId" => accountId.to_s,
        "v11:DateFilter" =>
          { "v11:DateFrom" => datefrom,
          "v11:DateTo" => dateto,
          :order! => ["v11:DateFrom", "v11:DateTo"]
        },
        :order! => ["v11:AccountId", "v11:DateFilter"]
      }
    end

    puts
    puts "This is ESI endpint for FinancialEventService...for account ID " + accountId.to_s
    @creationdate_node = response.xpath("//ns0:CreationDate", 'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
    @amount_node = response.xpath('//ns0:Amount', 'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
    @ratedescription_node = response.xpath('//ns0:RateDescription', 'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")

    xml_result = response.to_s
    xml_doc  = Nokogiri::XML(xml_result)

    # Result as a file
    self.saveESIResponse(xml_doc, accountId, "_Customer_Account_Financial_Event")
    self.logESIResponse_3nodes(@creationdate_node, @amount_node, @ratedescription_node, accountId, "_Customer_Account_Financial_Event")
  end

  def preferenceService_FindAccountPreference(accountId, preference_url)
    namespaces = {
      "xmlns:soap" => "http://www.w3.org/2003/05/soap-envelope",
      "xmlns:v1" => "http://www.shaw.ca/ns/schema/shared/v1",
      "xmlns:v11" => "http://www.shaw.ca/ns/schema/enterprise/v1"
    }

    client = Savon.client do
      wsdl preference_url
      env_namespace :soap
      namespace_identifier :v11
      namespaces namespaces
    end

    puts client.operations
    time = self.currentSystemTime

    response = client.call(:find_account_preference) do
      soap_header  "v1:MessageHeader" =>
        {"v1:CreatedDatetime" => time}

      message    "v11:AccountId" => accountId.to_s
    end

    xml_result = response.to_s
    xml_doc  = Nokogiri::XML(xml_result)

    puts "This is ESI endpint for Preference Service...for account ID " + accountId.to_s 
    @characteristicid_node = response.xpath("//ns0:CharacteristicId", 'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
    @characteristicname_node = response.xpath("//ns0:CharacteristicName", 'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")

    # Result as a file
    self.saveESIResponse(xml_doc, accountId, "_Find_Account_Preference")
    self.logESIResponse_2nodes(@characteristicid_node, @characteristicname_node, accountId, "_Find_Account_Preference")
  end

  def addressService11_FindServiceAddress(accountId, address_url)
    namespaces = {
      "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      "xmlns:v1" => "http://www.shaw.ca/ns/schema/shared/v1",
      "xmlns:v11" => "http://www.shaw.ca/ns/schema/enterprise/v1"
    }

    begin
      client = Savon.client do
        wsdl  address_url
        env_namespace :soapenv
        namespace_identifier :v11
        namespaces namespaces
      end

      puts client.operations
    rescue Exception => @error1
      puts "Something went wrong on SOAP error1, #{@error1.inspect}, ..."
    end  

    time = self.currentSystemTime

    begin
      response = client.call(:find_service_address) do
        soap_header  "v1:MessageHeader" =>     
          {"v1:CreatedDatetime" => time}

        message "v11:Entity" => "CustomerAccount",
          "v11:EntityId" => accountId.to_s,
          :order! => ["v11:Entity", "v11:EntityId"]
      end

    rescue Exception => @error2
      # Now "ex" is the name of the Exception. And "ex.inspect" inspects it.
      puts "Something went wrong on SOAP error 2, #{@error2.inspect}, .."
      puts "please check endpoint URL, or request XML ..."
      #raise
    end

    puts
    puts "This is ESI endpint for Address Service...for account ID " + accountId.to_s
    begin
      @americanpropertyaddressproperties_node = response.xpath("//ns0:AmericanPropertyAddressProperties", 'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @formattedaddressline1_node = response.xpath("//ns0:FormattedAddressLine1",'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @formattedaddressline2_node = response.xpath('//ns0:FormattedAddressLine2','ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")

      xml_result = response.to_xml
      xml_doc  = Nokogiri::XML(xml_result)
    rescue => e
      puts e.class
      puts "NO nodes captured! There is SOAP response with error back..."
    end

    # Result as a file
    self.saveESIResponse(xml_doc, accountId, "_find_Service_address")
    self.logESIResponse_2nodes(@formattedaddressline1_node, @formattedaddressline2_node, accountId, "_find_Service_address")
  end

  def addressService11_FindGeographicAddress(accountId, address_url)
    namespaces = {
      "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      "xmlns:v1" => "http://www.shaw.ca/ns/schema/shared/v1",
      "xmlns:v11" => "http://www.shaw.ca/ns/schema/enterprise/v1"
    }

    begin
      client = Savon.client do
        wsdl  address_url
        env_namespace :soapenv
        namespace_identifier :v11
        namespaces namespaces
      end

      puts client.operations
    rescue Exception => @error1
      puts
      puts "error 1: Something went wrong on SOAP, #{@error1.inspect}, ..."
    end  

    time = self.currentSystemTime

    begin
      response = client.call(:find_geographic_address) do
        soap_header  "v1:MessageHeader" =>     
          {"v1:CreatedDatetime" => time}

        message "v11:EntitySelection" =>
          {"v11:Entity" => "CustomerAccount",
          "v11:EntityId" => accountId.to_s,
          :order! => ["v11:Entity", "v11:EntityId"]
        }
      end

    rescue Exception => @error2
      # Now "ex" is the name of the Exception. And "ex.inspect" inspects it.
      puts
      puts "error 2 :Something went wrong on SOAP, #{@error2.inspect}, .."
      puts "please check endpoint URL, or request XML ..."
      #raise
    end

    puts
    puts "This is ESI endpint for Address Service...for account ID " + accountId.to_s
    begin
      #@americanpropertyaddressproperties_node = response.xpath("//ns0:AmericanPropertyAddressProperties", 'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @formattedaddressline1_node = response.xpath("//ns0:FormattedAddressLine1",'ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @formattedaddressline2_node = response.xpath('//ns0:FormattedAddressLine2','ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @locality_node = response.xpath('//ns0:Locality','ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @stateorprovince_node = response.xpath('//ns0:StateOrProvince','ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @country_node = response.xpath('//ns0:Country','ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @postcode_node = response.xpath('//ns0:Postcode','ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @startdatetime_node = response.xpath('//ns0:StartDateTime','ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @enddatetime_node = response.xpath('//ns0:EndDateTime','ns0' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")

      xml_result = response.to_xml
      xml_doc  = Nokogiri::XML(xml_result)
    rescue => @error3
      puts
      puts "error3 is: " + @error3.class.to_s
      puts "NO nodes captured! There is one of the node within SOAP response is wrong ..."
    end

    # Result as a file
    self.saveESIResponse(xml_doc, accountId, "_find_geographic_address")
    self.logESIResponse_6nodes(@formattedaddressline1_node, @formattedaddressline2_node, @locality_node, @stateorprovince_node, @country_node, @postcode_node, accountId, "_find_geographic_address")
  end

  def billingService_ReadBillingCycle(accountId, billing_url)
    namespaces = {
      "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      "xmlns:v1" => "http://www.shaw.ca/ns/schema/shared/v1",
      "xmlns:v11" => "http://www.shaw.ca/ns/schema/customer/v1"
    }
    begin      
      client = Savon.client do
        wsdl billing_url
        env_namespace :soapenv
        namespace_identifier :v11
        namespaces namespaces
      end

      puts client.operations
    rescue Exception => @error1
      puts "Something went wrong on SOAP error1, #{@error1.inspect}, ..."
    end    

    time = self.currentSystemTime

    begin
      response = client.call(:read_billing_cycle) do
        soap_header  "v1:MessageHeader" =>     
          {"v1:CreatedDatetime" => time}
        message  "v11:AccountId" => accountId.to_s
      end

    rescue Exception => @error2
      # Now "ex" is the name of the Exception. And "ex.inspect" inspects it.
      puts "Something went wrong on SOAP error 2, #{@error2.inspect}, .."
      puts "please check endpoint URL, or request XML ..."
      #raise
    end

    puts
    puts "This is ESI endpint for customerAccountBillService...for account ID " + accountId.to_s
    begin
      @billingperiodid_node = response.xpath("//cial:BillingPeriodId", 'cial' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @billingperiodname_node = response.xpath("//cial:BillingPeriodName", 'cial' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @billperioddescription_node = response.xpath("//cial:BillPeriodDescription",'cial' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")

      xml_result = response.to_xml
      xml_doc  = Nokogiri::XML(xml_result)
    rescue => e
      puts e.class
      puts "NO nodes captured! There is SOAP response with error back..."
    end

    # Result as a file
    self.saveESIResponse(xml_doc, accountId, "_Billing_Read_Billing_Cycle")
    self.logESIResponse_3nodes(@billingperiodid_node, @billingperiodname_node, @billperioddescription_node, accountId, "_Billing_Read_Billing_Cycle")
  end

  def contactService_FindContact(accountId, contact_url)
    namespaces = {
      "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      "xmlns:v1" => "http://www.shaw.ca/ns/schema/shared/v1",
      "xmlns:v11" => "http://www.shaw.ca/ns/schema/enterprise/v1"
    }
    begin      
      client = Savon.client do
        wsdl contact_url
        env_namespace :soapenv
        namespace_identifier :v11
        namespaces namespaces
      end

      puts client.operations
    rescue Exception => @error1
      puts "Something went wrong on SOAP error1, #{@error1.inspect}, ..."
    end

    time = self.currentSystemTime

    begin
      response = client.call(:find_contact) do
        soap_header  "v1:MessageHeader" =>     
          {"v1:CreatedDatetime" => time}
        message "v11:EntitySelection" =>
          {"v11:Entity" => "CustomerAccount",
          "v11:EntityId" => accountId.to_s,
          :order! => ["v11:Entity", "v11:EntityId"]
        }
      end

    rescue Exception => @error2
      # Now "ex" is the name of the Exception. And "ex.inspect" inspects it.
      puts "Something went wrong on SOAP error2, #{@error2.inspect}, .."
      puts "please check endpoint URL, or request XML ..."
      #raise
    end

    puts
    puts "This is ESI endpint for Contact Service...for account ID " + accountId.to_s
    begin
      @formattedname_node = response.xpath("//cial:FormattedName", 'cial' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @formattedaddressline1_node = response.xpath("//cial:FormattedAddressLine1", 'cial' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @formattedaddressline2_node = response.xpath("//cial:FormattedAddressLine2", 'cial' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @telephonenumber_node = response.xpath("//cial:TelephoneNumber", 'cial' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")
      @email_node = response.xpath("//cial:Email", 'cial' => "http://cia.services.cablelabs.com/schemas/v1/CIALib")


      xml_result = response.to_xml
      xml_doc  = Nokogiri::XML(xml_result)
    rescue => e
      puts e.class
      puts "NO nodes captured! There is SOAP response with error back..."
    end
    # Result as a file
    self.saveESIResponse(xml_doc, accountId, "_Contact_Find_Contact")
    self.logESIResponse_4nodes(@formattedname_node, @formattedaddressline1_node, @telephonenumber_node, @email_node, accountId, "_Contact_Find_Contact")
  end
end #class
