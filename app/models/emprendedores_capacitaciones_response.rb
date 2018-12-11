class EmprendedoresCapacitacionesResponse < ApplicationRecord
    
    has_one :evaluation, as: :evaluatable
end
