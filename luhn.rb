# Implementation of the Luhn algorithm to verify the validity of a bank card number

def verify_card_valid(account_number)
  digits = account_number.chars.map(&:to_i)
  check = digits.pop

  sum = digits.reverse.each_slice(2).flat_map do |x, y|
    [(x * 2).divmod(10), y || 0]
  end.flatten.inject(:+)

  check.zero? ? sum % 10 == 0 : (10 - sum % 10) == check
end

# visa generator number -> valid
puts "Valid: "
puts verify_card_valid "4302011237662428"
puts verify_card_valid "4489323322738939"
puts verify_card_valid "4971268590263679"

# changed account number -> not valid
puts "\nNot valid: "
puts verify_card_valid "0658674587210344"
puts verify_card_valid "4584439747423419"
puts verify_card_valid "8752450232505254"

