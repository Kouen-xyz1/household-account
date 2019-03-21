class Household < ApplicationRecord
  enum payment: { 現金: 1, 銀行口座: 2, クレジットカード: 3, デビットカード: 4, ギフト券: 5, ポイント: 6, その他: 7 }
  enum check_out: {受取: 1,支払: 2, 完了: 3}
  enum detail: {未確認: 1}
  enum analysis: {needs: 1,wants: 2}
end
