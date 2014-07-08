class VirtualAccountProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def method_missing(name, *args)
    puts("Delegating #{name} message to subject.")
    @subject.send(name, *args)
  end

  def subject
    @subject || @creation_block.call
  end
end

class BankAccount
end

account = VirtualAccountProxy.new { BankAccount.new }


class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @real_account = real_account
    @owner_name = owner_name
  end

  def method_missing(name, *args)
    check_access
    @subject.send(name, *args)
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access: #{@owner_name} cannot access account."
    end
  end
end


class VirtualProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def method_missing(name, *args)
    s = subject
    s.send(name, *args)
  end

  def subject
    @subject ||= @creation_block.call
  end
end

array = VirtualProxy.new { Array.new }
array << 5
