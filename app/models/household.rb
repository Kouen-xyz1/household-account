class Household < ApplicationRecord
  enum payment: { cash: 1, bank_account: 2, credit: 3, debit: 4, gift_card: 5, point: 6, others: 7 }
  enum check_out: {receive: 1, pay: 2, complete_c: 3}
  enum detail: {incomplete: 1, complete_d: 2}
  enum analysis: {needs: 1,wants: 2}
end
